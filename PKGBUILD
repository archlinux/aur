# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1628
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz")
sha512sums=('ab47caa4406ba57c0afc6fadae304fc9ef5e3e125be0f2fb1955a419cf93cd5e9176e103f0b566825abc16cca00b795f98d2b407f0a2bf7b141ef4b025d907d0')

prepare() {
	sed -e 's|$(CCFLAGS)|& $(CFLAGS)|' \
	    -e 's|$(LNFLAGS)|& $(LDFLAGS)|' \
	    -e 's|-Werror ||' -e 's|-ggdb -O0||' \
	    -i src/makefile
}

build() {
	cd src
	make
}

package() {
	install -Dm755 src/tpm_server -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

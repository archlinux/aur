# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pam-oauth2
pkgver=1.0.1
_jsmnver=1.1.0
pkgrel=2
pkgdesc="OAuth2 pam module"
arch=(x86_64)
url="https://github.com/CyberDem0n/$pkgname"
license=(MIT)
makedepends=(curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
		"jsmn-$_jsmnver.tar.gz::https://github.com/zserge/jsmn/archive/v$_jsmnver.tar.gz")
sha256sums=('7eabb1be36183a6c6c7505c5dcfde284b7722c095d925c6a03add9bd0a82774b'
            '5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf .gitmodules jsmn
	ln -sf ../jsmn-$_jsmnver jsmn
	sed -i -e '/^LIBDIR=/,/^PAM_DIR=/d' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PAM_DIR="/usr/lib/security" install
}

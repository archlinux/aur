# Maintainer: Cameron Katri <katri.cameron@gmail.com>

pkgname=ldid
pkgver=2.1.2
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning iOS binaries"
provides=('ldid' 'ldid2')
arch=('x86_64')
url="https://git.saurik.com/ldid"
license=('AGPL')
makedepends=('git' 'clang')
depends=('openssl' 'libplist' 'libxml2')
optdepends=()
source=("$pkgname-$pkgver::https://github.com/Diatrus/saurik-ldid/archive/v$pkgver.tar.gz")
sha256sums=('00c90d3528365b110b8ad5fc5aa148c68175ed7023e966959c6db2899e05dd93')

build() {
	cd saurik-ldid-$pkgver
	clang -I. -c -o lookup2.o lookup2.c
	clang++ -std=c++11 -o ldid lookup2.o ldid.cpp -I. -lcrypto -lplist-2.0 -lxml2
}

package() {
	cd saurik-ldid-$pkgver
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	ln -s ldid ${pkgdir}/usr/bin/ldid2
}

# Maintainer: Cameron Katri <katri.cameron@gmail.com>

pkgname=ldid
pkgver=v2.1.2.r0.gc2f8abf
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning iOS binaries"
provides=('ldid' 'ldid2')
arch=('x86_64')
url="https://git.saurik.com/ldid"
license=('AGPL')
makedepends=('git' 'clang')
depends=('openssl' 'libplist' 'libxml2')
optdepends=()
source=("git+https://github.com/diatrus/saurik-ldid")
sha256sums=('SKIP')

pkgver() {
	cd saurik-ldid
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd saurik-ldid
	clang -I. -c -o lookup2.o lookup2.c
	clang++ -std=c++11 -o ldid lookup2.o ldid.cpp -I. -lcrypto -lplist-2.0 -lxml2
}

package() {
	cd saurik-ldid
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	ln -s ldid ${pkgdir}/usr/bin/ldid2
}

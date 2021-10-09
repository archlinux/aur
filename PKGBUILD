# Maintainer: Cameron Katri <katri.cameron@gmail.com>

pkgname=ldid
pkgver=2.1.2
pkgrel=2
pkgdesc="a tool used for ad-hoc codesigning iOS binaries - CRKatri's mirror"
provides=('ldid' 'ldid2')
arch=('x86_64')
url="https://git.saurik.com/ldid"
license=('AGPL')
depends=('openssl' 'libplist' 'libxml2')
source=("https://github.com/CRKatri/ldid/archive/$pkgver.tar.gz")
md5sums=('8af2d65766f11fef4e90b26a4694c8b6')

build() {
	cd ldid-$pkgver
	cc ${CFLAGS} -I. -c -o lookup2.o lookup2.c
	c++ ${CXXFLAGS} -std=c++11 -o ldid lookup2.o ldid.cpp -I. -lcrypto -lplist-2.0 -lxml2
}

package() {
	cd ldid-$pkgver
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	ln -s ldid ${pkgdir}/usr/bin/ldid2
}

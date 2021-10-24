# Maintainer: Cameron Katri <katri.cameron@gmail.com>

pkgname=ldid
pkgver=2.1.5procursus2
_pkgver=2.1.5-procursus2
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning Darwin binaries - Procursus fork"
provides=('ldid' 'ldid2')
arch=('x86_64')
url="https://github.com/ProcursusTeam/ldid"
license=('AGPL')
depends=('openssl' 'libplist' 'libxml2')
source=("https://github.com/ProcursusTeam/ldid/archive/v$_pkgver.tar.gz")
b2sums=('3651f04ed54bebae470615a15d4c8945ea57d2f4bffd57d63ce6971945009c958713d51c51a059c06b58295a23c169e558d596a881c3aaad533102bca66b0978')

build() {
	cd ldid-$_pkgver
	cc ${CFLAGS} -I. -c -o lookup2.o lookup2.c
	c++ ${CXXFLAGS} -DLDID_VERSION=\"2.1.5-procursus2\" -std=c++11 -o ldid lookup2.o ldid.cpp -I. -lcrypto -lplist-2.0 -lxml2
}

package() {
	cd ldid-$_pkgver
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	ln -s ldid ${pkgdir}/usr/bin/ldid2
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sqlbox
pkgdesc='Privilege-separated multiprocess secure database access library'
pkgver=0.2.0
pkgrel=1
url=https://kristaps.bsd.lv/sqlbox/
license=(0BSD)
makedepends=(bmake sqlite3)
depends=(glibc)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
b2sums=('503ef014b3c55049bc9b41cbe729c0888a28e9c1821d6fc181b868cd4c8435bb09abb9741eebfcc6b07f4edcb8c237a30970c4b4858dc922b9704138ca32d266')

build () {
	cd "${pkgname}-${pkgver}"
	CFLAGS="${CFLAGS}" ./configure PREFIX=/usr MANDIR=/usr/share/man LDFLAGS="${LDFLAGS}"
	bmake MAKE=bmake
}

check () {
	cd "${pkgname}-${pkgver}"
	bmake regress MAKE=bmake
}

package () {
	cd "${pkgname}-${pkgver}"
	bmake install DESTDIR="${pkgdir}" MAKE=bmake
}

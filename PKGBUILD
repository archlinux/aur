# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sqlbox
pkgdesc='Privilege-separated multiprocess secure database access library'
pkgver=0.2.1
pkgrel=1
url=https://kristaps.bsd.lv/sqlbox/
license=(0BSD)
makedepends=(bmake sqlite3)
depends=(glibc)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
b2sums=('33b163893319e549b7cc313ed74167f8f6251fea4a6925a5df488665785af9544a21ab3e02cab9fb70b2745e242854087b489daa7f4b4a6b70773a57ecf6ed5d')

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

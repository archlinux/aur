# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sqlbox
pkgdesc='Privilege-separated multiprocess secure database access library'
pkgver=0.1.13
pkgrel=1
url=https://kristaps.bsd.lv/sqlbox/
license=(0BSD)
makedepends=(bmake sqlite3)
depends=(glibc)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
b2sums=('d676f121fae87b74e02be2a4bd5a879ee21d3ba55a3c31ebf5157bfa698136ad86a34d2356665a0967410696b2886e5c93e98f87e897c40f6462d400f6df982f')

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

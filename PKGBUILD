# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sqlbox
pkgdesc='Privilege-separated multiprocess secure database access library'
pkgver=0.1.12
pkgrel=1
url=https://kristaps.bsd.lv/sqlbox/
license=(custom:BSD)
makedepends=(bmake sqlite3)
depends=(glibc)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz" LICENSE)
sha512sums=('76d3ee07dff8336370a12365a4ef1ff0ca0073dc5c33dc33695fff53e33dd25a67841ba4a4f22ca0e51ce39549b0f7ca70cb49864b04ebc552668fb2f001947c'
            'a861c45cd4c1cf14ffe959393866afbdf05c543621243ec5151450fa0ccda4543d5947ab16c073a137f13944d451e6451d8da3977bc77c19ea1edef5b80ca368')

build () {
	cd "${pkgname}-${pkgver}"
	CFLAGS="${CFLAGS}" ./configure PREFIX=/usr MANDIR=/usr/share/man LDFLAGS="${LDFLAGS}"
	bmake
}

check () {
	cd "${pkgname}-${pkgver}"
	bmake regress
}

package () {
	cd "${pkgname}-${pkgver}"
	bmake install DESTDIR="${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

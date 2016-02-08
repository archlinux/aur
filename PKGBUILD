# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='titus'
pkgdesc='Totally Isolated TLS Unwrapping Server'
pkgver='0.3'
pkgrel='1'
url='https://www.opsmate.com/titus/'
license=('custom:MIT')
arch=('i686' 'x86_64' 'arm')
depends=('openssl>=1.0.1f')
source=(
    "https://www.opsmate.com/titus/downloads/${pkgname}-${pkgver}.tar.gz"
    "https://www.opsmate.com/titus/downloads/${pkgname}-${pkgver}.tar.gz.asc"
)
options=('zipman')
validpgpkeys=('EF5D84C1838F2EB6D8968C0410378EFC2080080C')
sha512sums=('596948cb91c6d245a64057e116612e356165d4ab431d5edbae3ef64c4ffe7d11c325c80363978e819035c2632dbbc25d0f23b73eab1a02dced354161988a1396'
            'SKIP')

build () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
	install -Dm644 titus.conf.example "${pkgdir}/etc/titus.conf.example"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	for doc in NEWS README ; do
	    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
	done
}

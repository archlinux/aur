# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='titus'
pkgdesc='Totally Isolated TLS Unwrapping Server'
pkgver='0.2'
pkgrel='1'
url='https://www.opsmate.com/titus/'
license='MIT'
arch=('i686' 'x86_64' 'arm')
depends=('openssl>=1.0.1f')
source=(
    "https://www.opsmate.com/titus/downloads/${pkgname}-${pkgver}.tar.gz"
    "https://www.opsmate.com/titus/downloads/${pkgname}-${pkgver}.tar.gz.asc"
)
options=('zipman')
validpgpkeys=('EF5D84C1838F2EB6D8968C0410378EFC2080080C')
sha512sums=('a4b2f8723b54596d8d88fbb2acb9b7295510d93ad872560da949e23fe8340dd90145a891c66840c0a484158b54026e1d737fb897c2519c202d038cd336dd274d'
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

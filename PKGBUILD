# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='17'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2b20e2c2d073c1ff695b6ec0b9b90e0870c6bd60dc107b428090f3c66f8e215473779d824fcd5c3b0ade429071b99336ce066c3254e286be2aa4e4a312742404')
depends=('libbsd>=0.7')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	if [ -r /etc/makepkg.conf ] ; then
		eval "$(sed -e '/^CFLAGS=/s/^/EXTRA_/p' -e d /etc/makepkg.conf)"
		eval "$(sed -e '/^LDFLAGS=/s/^/EXTRA_/p' -e d /etc/makepkg.conf)"
	fi
	make PREFIX='/usr' LTO=1 \
		EXTRA_CFLAGS="${EXTRA_CFLAGS}" EXTRA_LDFLAGS="${EXTRA_LDFLAGS}"
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
}

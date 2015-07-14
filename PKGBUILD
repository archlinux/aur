# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='12'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e34a1a4381ff4d762cfdee396c6fd08ad0e5a7666dc98fc6f69d1368d9a703928f937cd238c77938b07c4573551b00a3aa95328041ccbb518cf476275ff0a1fb')
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

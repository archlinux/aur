# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='14'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('81aeb8f176bef1a3a141741ec2e98c670330d7c3ac7292458adb73b09a807d9fab80cc7aabeaa3106cdafadee5dda0a7b2cf8d5ad86990525391286b09b9dcee')
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

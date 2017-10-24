# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lowdown'
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver='0.3.0'
pkgrel='1'
license=('custom:BSD')
url='https://kristaps.bsd.lv/lowdown/'
arch=('i686' 'x86_64')
depends=('glibc')
source=("https://github.com/kristapsdz/lowdown/archive/VERSION_${pkgver//\./_}.tar.gz")
sha512sums=('87469406fdfd37a2af56363e6e5697770cee785a3d905432470bec5bb68b76e921c5f36a92a4b23ee95029eb08f88c35d6681fff004828387aef6281c4da0cf0')

build () {
	cd "${pkgname}-VERSION_${pkgver//\./_}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
}

package () {
	cd "${pkgname}-VERSION_${pkgver//\./_}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

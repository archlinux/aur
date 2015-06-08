# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=xteddy
pkgver=2.2
pkgrel=3
pkgdesc='Your virtual comfort when things get rough'
url='http://webstaff.itn.liu.se/~stegu/xteddy/'
license=('GPL')
depends=('imlib2')
arch=('i686' 'x86_64' 'armv7h')
source=("http://webstaff.itn.liu.se/~stegu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('4fcf2efc6e0f2e02ce32597d2ccfbfb2bf057199')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed '/AM_LDFLAGS =/s/$/ -lXext/' -i Makefile.*
	sed 's:/usr/games/xteddy:/usr/bin/xteddy:g' -i xtoys
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

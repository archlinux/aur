# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: me at oguzkaganeren dot com dot tr
pkgname=grisbi
pkgver=1.2.2
pkgrel=2
pkgdesc="Shared files for the finance management program Grisbi."
arch=('x86_64')
url="http://www.grisbi.org"
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'libgsf')
makedepends=('gettext' 'grep' 'imagemagick' 'intltool')
optdepends=('goffice0.8: for drawing charts' 'libofx: support for the OFX banking standard')
options=(!libtool)
install=grisbi.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7c6dcb9d123076df33f7225085db44f0b95afbb773378fd94b7c492dbbf731de')

prepare() {
	cd "${pkgname}-${pkgver}"
	cd pixmaps
	convert -size 48x48 -background none grisbi.svg grisbi.png
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
		--disable-frenchdoc \
		--prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/pixmaps/grisbi.png" \
		"${pkgdir}/usr/share/pixmaps/grisbi/grisbi.png"
}

# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: me at oguzkaganeren dot com dot tr
pkgname=grisbi
pkgver=3.0.4
_pkgver=upstream_version_3_0_4
pkgrel=3
pkgdesc="Shared files for the finance management program Grisbi."
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'libgsf' 'openssl')
optdepends=('libofx: for OFX support')
makedepends=('intltool' 'imagemagick')
conflicts=('grisbi-git')
options=(!libtool !debug)
source=(https://github.com/grisbi/grisbi/archive/refs/tags/$_pkgver.tar.gz)
sha256sums=('80f467c01a946b8229841643d2b5e4da080deb3e910a12ed28977b1bb7121bc2')

prepare() {
	cd "${srcdir}/grisbi-${_pkgver}"
	cd pixmaps
	convert -size 48x48 -background none grisbi.svg grisbi.png
}

build() {
	cd "${srcdir}/grisbi-${_pkgver}"
	./autogen.sh
	./configure \
		--disable-frenchdoc \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/grisbi-${_pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm 0644 "${srcdir}/grisbi-${_pkgver}/pixmaps/grisbi.png" \
		"${pkgdir}/usr/share/pixmaps/grisbi/grisbi.png"
}

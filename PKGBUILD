# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=icon-slicer
pkgver=0.3
pkgrel=6
pkgdesc='A utility for generating icon themes and libXcursor cursor themes'
arch=('i686' 'x86_64')
url='http://freedesktop.org/wiki/Software/icon-slicer'
license=('GPL')
depends=('gdk-pixbuf2' 'popt' 'xorg-xcursorgen')
source=("http://freedesktop.org/software/${pkgname}/releases/icon-slicer-${pkgver}.tar.gz"
	'hotspots.patch')
sha1sums=('82284a87061ad9e1872e61963597c39ddcba53da'
	  'b9bf8e11ebc444fbcb3f6995d7e5a649f79d346f')

build() {
	cd "${srcdir}/icon-slicer-${pkgver}"

	patch -p1 -i "${srcdir}/hotspots.patch"
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "${srcdir}/icon-slicer-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

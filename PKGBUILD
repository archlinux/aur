# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: David Dent <thewinch@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=gpxviewer
arch=('i686' 'x86_64' 'armv7h')
pkgver=0.4.0
pkgrel=1
pkgdesc="a simple program to visualize a gpx file"
license=('GPL2')
url="http://blog.sarine.nl/gpx-viewer/"
depends=('gdl' 'libchamplain' 'hicolor-icon-theme')
makedepends=('intltool' 'vala')
conflicts=('gpxviewer-bzr')
source=("https://launchpad.net/gpx-viewer/trunk/${pkgver}/+download/gpx-viewer-${pkgver}.tar.gz" 'gpxviewer.desktop')
install=${pkgname}.install
md5sums=('f019a8fdf27391ca568f022b60d381c6'
         '8d5ed2f4f1f26a60d078a77f9fd5f2a3')

build() {
	cd "${srcdir}/gpx-viewer-${pkgver}"
	sed -ie 's|desktopdir = $(DESTDIR)/|desktopdir =|' Makefile.in

	./configure \
		--prefix=/usr \
		--enable-database-updates=no
	make
}

package() {
	cd "${srcdir}/gpx-viewer-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azcomicv
pkgver=2.0.3
pkgrel=1
pkgdesc="A simple comic viewer for Linux"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azcomicv.html"
license=('GPL3')
depends=('libx11' 'libxext' 'libxcursor' 'hicolor-icon-theme' 'freetype2' 'fontconfig' 'zlib' 'libpng' 'libtiff' 'libjpeg-turbo')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('8a7bd329667b2a3a8fc288cf54839f87a7a739a92cc476dd742b189d1a46d3e4')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	# HACK Original Makefile tries to update mimeinfo.cache and icon-theme.cache.
	# These files should be updated after installation.
	sed -i '/\@\$(update_cache)/d' Makefile
	make \
		prefix="${pkgdir}/usr" \
		bindir="${pkgdir}/usr/bin" \
		datarootdir="${pkgdir}/usr/share" \
		datadir="${pkgdir}/usr/share/azcomicv" \
		docdir="${pkgdir}/usr/share/doc/azcomicv" \
		install
}

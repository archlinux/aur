# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azcomicv
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple comic viewer for Linux"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azcomicv.html"
license=('GPL3')
depends=('libx11' 'libxext' 'libxcursor' 'hicolor-icon-theme' 'freetype2' 'fontconfig' 'zlib' 'libpng' 'libtiff' 'libjpeg-turbo')
source=("http://azsky2.html.xdomain.jp/arc/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8f47b243a17e2eb4f80c2330844c38e0a4aece77db21a9835ce3ac99fe3e64de')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
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

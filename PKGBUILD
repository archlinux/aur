# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azpainterb
pkgver=1.1.3b2
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("http://azsky2.html.xdomain.jp/arc/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6a7651d365c1f7387f332d5c13bb4f8633056965825ecf9e5c809a0dbabc5598')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# HACK Original Makefile tries to update mimeinfo.cache and icon-theme.cache.
	# These files should be updated after installation.
	sed -i '/\@-\$(update_cache)/d' Makefile
	make \
		prefix="${pkgdir}/usr" \
		bindir="${pkgdir}/usr/bin" \
		datarootdir="${pkgdir}/usr/share" \
		datadir="${pkgdir}/usr/share/azpainterb" \
		install
}

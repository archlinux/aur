# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azpainterb
pkgver=1.1.3
pkgrel=1
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("http://azsky2.html.xdomain.jp/arc/${pkgname}-${pkgver}.tar.xz")
sha256sums=('03777b03e92f679a0fc737e8ef1f851a18c73bd546bb9a4a26d609cad4c6df2b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
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
		datadir="${pkgdir}/usr/share/azpainterb" \
		docdir="${pkgdir}/usr/share/doc/azpainterb" \
		install
}

# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azpainterb
pkgver=1.1.3
pkgrel=3
pkgdesc="PixelArt/Paint/Retouch Software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainterb.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'zlib')
source=("https://gitlab.com/azelpg/azpainterb/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('5cdcbc2cfb9ec2e3e005e7770ba6d87a8cab224744d4c2314f430a92b6696466')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./configure --prefix=/usr
	make ${MAKEOPTS}
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
		datadir="${pkgdir}/usr/share/azpainterb" \
		docdir="${pkgdir}/usr/share/doc/azpainterb" \
		install
}

# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azcomicv
pkgver=2.0.4
pkgrel=1
pkgdesc="A simple comic viewer for Linux"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azcomicv.html"
license=('GPL3')
depends=('libx11' 'libxext' 'libxcursor' 'hicolor-icon-theme' 'freetype2' 'fontconfig' 'zlib' 'libpng' 'libtiff' 'libjpeg-turbo')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('e5f1ed9af311c1e5128cc4445f6325c5e6c891963afdd743fcffb18150b237d2')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./configure --prefix=/usr
	cd build/
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}/build/"
	# HACK Original Makefile tries to update mimeinfo.cache and icon-theme.cache.
	# These files should be updated after installation.
	sed -i '/^\s*update_icon$/d' install.sh
	DESTDIR="${pkgdir}" ninja install
}

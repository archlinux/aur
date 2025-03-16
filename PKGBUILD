# Maintainer: Shusui Moyatani <syusui.s at gmail dot com>

pkgname=azcomicv
pkgver=2.0.6
pkgrel=1
pkgdesc="A simple comic viewer for Linux"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azcomicv.html"
license=('GPL3')
depends=('libx11' 'libxext' 'libxcursor' 'hicolor-icon-theme' 'freetype2' 'fontconfig' 'zlib' 'libpng' 'libtiff' 'libjpeg-turbo' 'libheif')
makedepends=('ninja')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('c55c370ffcf4a3595e04ac0edb5aa3ae444911dea9bc4f2f54a8728fbb02eb11')

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

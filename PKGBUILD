# Maintainer: lks <lukas dot graetz et web dot de>
# based on cairo PKGBUILD by: Jan de Groot <jgc@archlinux.org>

pkgname=cairo-dfb
_pkgname=cairo
pkgver=1.14.2
pkgrel=1
pkgdesc="Cairo vector graphics library with directfb backend"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('directfb' 'libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'sh' 'lzo2')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
             # for the test suite:
#             'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
provides=('cairo-xcb' "cairo=${pkgver}")
replaces=('cairo-xcb')
conflicts=('cairo')
source=(http://cairographics.org/releases/$_pkgname-$pkgver.tar.xz)
sha1sums=('c8da68aa66ca0855b5d0ff552766d3e8679e1d24')

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-lto \
	--enable-tee \
	--enable-gl \
	--enable-egl \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject \
	--enable-directfb #\
	# --enable-gtk-doc
	
	#--disable-xlib-xcb \
	# --enable-test-surfaces \ takes ages
	#--enable-drm # breaks build
	
  make
}

#check() {
#  cd $_pkgname-$pkgver
#  make -k test || /bin/true
#  
#  # results:
#  # 1.12.8-1	# 162 Passed, 328 Failed [8 crashed, 10 expected], 26 Skipped
#  # 1.12.12-2:	# 29 Passed, 464 Failed [460 crashed, 2 expected], 26 Skipped
#  # 1.12.16-1:	144 Passed, 364 Failed [6 crashed, 12 expected], 27 Skipped
#
#}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

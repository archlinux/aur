# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: dx <dx@dxzone.com.ar>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cairo-git
epoch=1
pkgver=1.14.2.r6.g7139265
pkgrel=1
pkgdesc="Cairo vector graphics library (git version)"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0' 'glib2' 'mesa' 'libgl' 'lzo')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
provides=("cairo=$pkgver" "cairo-xcb=$pkgver")
conflicts=('cairo' 'cairo-xcb')
source=('git://anongit.freedesktop.org/git/cairo')
sha1sums=('SKIP')

pkgver() {
	cd cairo
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd cairo
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--enable-tee \
		--enable-gl \
		--enable-egl \
		--enable-svg \
		--enable-ps \
		--enable-pdf \
		--enable-gobject \
		--enable-gtk-doc
  make
}

package(){
	cd cairo
	make DESTDIR="${pkgdir}" install
}

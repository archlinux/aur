# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=cairo-minimal
pkgver=1.14.8
pkgrel=1
pkgdesc="A vector graphics library - build with minimal dependencies"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'sh' 'fontconfig' 'pixman>=0.30.0' 'glib2' 'lzo2' 'gcc-libs')
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb' 'cairo')
source=(http://cairographics.org/releases/${pkgname:0:5}-$pkgver.tar.xz)

sha1sums=('c6f7b99986f93c9df78653c3e6a3b5043f65145e')

build() {
  cd ${pkgname:0:5}-$pkgver

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-tee \
	--disable-gl \
	--disable-egl \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject
  make
}

package() {
  cd ${pkgname:0:5}-$pkgver
  make DESTDIR="$pkgdir" install
}

# Maintainer: Mathijs van de Nes <aur@mathijs.vd-nes.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-nomesa
pkgver=1.14.8
pkgrel=1
pkgdesc="A vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.30.0' 'glib2' 'lzo2' 'gcc-libs')
makedepends=('gtk-doc')
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb')
conflicts=('cairo-xcb' 'cairo')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz)

sha1sums=('c6f7b99986f93c9df78653c3e6a3b5043f65145e')

build() {
  cd cairo-$pkgver

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
  cd cairo-$pkgver
  make DESTDIR="$pkgdir" install
}

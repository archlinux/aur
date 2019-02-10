# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=cairo-minimal
pkgver=1.16.0
pkgrel=1
pkgdesc="A vector graphics library - build with minimal dependencies"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(libpng fontconfig pixman glib2 lzo)
provides=(cairo)
replaces=(cairo)
source=(http://cairographics.org/releases/${pkgname:0:5}-$pkgver.tar.xz)

sha1sums=('00e81842ae5e81bb0343108884eb5205be0eac14')

build() {
  cd ${pkgname:0:5}-$pkgver

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-gl \
	--enable-tee \
	--enable-svg \
	--enable-ps \
	--enable-pdf \
	--enable-gobject
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname:0:5}-$pkgver
  make DESTDIR="$pkgdir" install
}

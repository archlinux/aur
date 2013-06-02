# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=2.0.4
pkgrel=2
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="http://www.clutter-project.org/"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage gst-plugins-bad)
makedepends=(gobject-introspection)
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('bad69cca7dd9c0d54d4f9fc27cba59dd8d8b329db058844716dbdecec6caba97')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

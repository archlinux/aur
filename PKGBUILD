# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clutter-gst
pkgver=2.0.6
pkgrel=2
pkgdesc="GStreamer bindings for clutter"
arch=(i686 x86_64)
url="http://www.clutter-project.org/"
license=(LGPL)
depends=(clutter gst-plugins-base-libs libxdamage gst-plugins-bad)
makedepends=(gobject-introspection)
options=('!libtool')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('0ecc5630b0578968201802b831a75904a26e6ffe38fb8b60209ef9da51f8b258')

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

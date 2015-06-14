# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>
pkgname=entangle
pkgver=0.7.0
pkgrel=3
pkgdesc="Entangle provides a graphical interface for “tethered shooting”, aka taking photographs with a digital camera completely controlled from the computer."
arch=('i686' 'x86_64')
url="http://entangle-photo.org/"
license=('GPL')
depends=('dbus-glib>=0.60' 'gdk-pixbuf2' 'gtk3' 'libgphoto2' 'libsystemd' 'dbus-glib' 'gobject-introspection' 'lcms' 'libpeas' 'libgexiv2' 'libraw' 'gnome-icon-theme-symbolic' 'itstool' 'yelp-tools')
makedepends=('intltool')
install=entangle.install
source=(http://entangle-photo.org/download/sources/$pkgname-$pkgver.tar.gz)
md5sums=('bdb5fab70276ea27c4614fecfa5c1d86')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

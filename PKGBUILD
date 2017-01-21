# $Id: PKGBUILD 176208 2016-05-24 11:46:59Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=blam
pkgver=1.8.12
pkgrel=4
pkgdesc="Simple newsreader for GNOME written in C Sharp"
arch=('any')
url="https://git.gnome.org/browse/blam"
license=('GPL')
depends=('webkit-sharp' 'gconf-sharp' 'notify-sharp')
makedepends=('intltool')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('6294d13629cd0cabc50ed3a489682b50c2c61972d55d8209b59b2a8b434810ea')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's/dbus-sharp-glib-1.0/dbus-sharp-glib-2.0/g' configure.ac
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

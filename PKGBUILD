# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.6.6
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('9440a68600f58d00fe0af35383738943e8ead9907f4cf507a102d96822434a28')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

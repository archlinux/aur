# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.5.4
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gtk3')
makedepends=('gobject-introspection' 'python2')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('db9c710ea3970620278c58d0bc522018353a75c83ac6ad60e272d2532533e772')

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

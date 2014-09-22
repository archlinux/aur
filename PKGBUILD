# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.6.0
pkgrel=1
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('clutter' 'gtk3')
makedepends=('gobject-introspection' 'python2')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('883550b574a036363239442edceb61cf3f6bedc8adc97d3404278556dc82234d')

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

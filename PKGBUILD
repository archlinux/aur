# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=goocanvas3
pkgver=3.0.0
pkgrel=1
pkgdesc="A cairo canvas widget for GTK+"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GooCanvas"
license=(LGPL)
depends=(gtk3)
makedepends=(gobject-introspection python-gobject)
conflicts=(goocanvas)
source=("https://download.gnome.org/sources/goocanvas/${pkgver%.*}/goocanvas-$pkgver.tar.xz")
sha256sums=('670a7557fe185c2703a14a07506156eceb7cea3b4bf75076a573f34ac52b401a')

build() {
  cd "goocanvas-$pkgver"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "goocanvas-$pkgver"
  make DESTDIR="$pkgdir" install
}

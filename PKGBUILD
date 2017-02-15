# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=hippo-canvas
pkgver=0.3.1
pkgrel=1
pkgdesc="Canvas library with an element model (deprecated)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/HippoCanvas"
license=('LGPL')
depends=('gtk2')
makedepends=('gobject-introspection' 'pygtk')
optdepends=('pygtk: python2 bindings')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('aaed1ad31f905750c57cacbfeb0e3af4d62e45b881ebeabeeedd864b56f9ed95')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr PYTHON=python2 LDFLAGS="$LDFLAGS -lgmodule-2.0"
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

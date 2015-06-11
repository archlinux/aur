# Maintainer: Kevin Brodsky <corax26 at gmail dot com>

_pkgbase=gtk-xfce-engine
pkgname=lib32-$_pkgbase
pkgver=2.10.1
pkgrel=1
pkgdesc="Xfce Gtk+-2.0 engine (32-bit)"
arch=('x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk2' $_pkgbase)
source=(http://archive.xfce.org/src/xfce/$_pkgbase/${pkgver%.*}/$_pkgbase-$pkgver.tar.bz2)
sha256sums=('4a92910205881f707f2cc8d3c9b00a95feb58eb9084d932c841f3ed027f7063d')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd "$srcdir/$_pkgbase-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/share
}

# vim:set ts=2 sw=2 et:

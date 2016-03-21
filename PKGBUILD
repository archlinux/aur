# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-break-timer
pkgver=1.1
pkgrel=3
pkgdesc="Keeps track of how much you are using the computer, and it reminds you to take regular breaks"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/GnomeBreakTimer"
license=('GPL3')
depends=('libgee' 'gtk3' 'json-glib' 'libcanberra' 'libnotify')
makedepends=('intltool' 'vala' 'gobject-introspection')
install=$pkgname.install
source=(http://pkgbuild.com/~bgyorgy/sources/$pkgname-$pkgver.tar.xz
        gee-0.8.patch)
sha256sums=('4b66c10d15ae5421a9f30bb2c10cdcc136544efce7677dcfd7637c0c2a7cc6b3'
            '36affcbff2b0892fd8a62832d65bb6511edee4cc927f08b1dc904c8aa8ee7bc9')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gee-0.8.patch
  autoreconf -fi
  intltoolize --force
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/doc"
}

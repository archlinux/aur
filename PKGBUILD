# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jorge Mokross <mokross@gmail.com>

pkgname=notify-sharp-3
_pkgname=notify-sharp
pkgver=3.0.0
pkgrel=1
pkgdesc="C# D-Bus client library for desktop notifications (GTK+ 3 version)"
arch=('any')
url="https://www.meebey.net/projects/notify-sharp/"
license=('MIT')
depends=('gtk-sharp-3' 'dbus-sharp-glib') 
source=(https://www.meebey.net/projects/$_pkgname/downloads/$_pkgname-$pkgver.tar.gz
        avoid-confilct.patch)
sha256sums=('5fb25f6ce9a3c27f0a6b927ee0a4ef6d02f6e6a2b8037d4dd525977840bd9345'
            '35ddc863f8999850d7444693a33c439b646cd5728a723a12eecdc8cc47808779')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Avoid conflict with notify-sharp 2
  patch -Np1 -i ../avoid-confilct.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

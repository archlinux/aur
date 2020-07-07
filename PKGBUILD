# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jorge Mokross <mokross@gmail.com>

pkgname=notify-sharp-3
_pkgname=notify-sharp
pkgver=3.0.3
pkgrel=4
pkgdesc="C# D-Bus client library for desktop notifications (GTK+ 3 version)"
arch=('any')
url="https://www.meebey.net/projects/notify-sharp/"
license=('MIT')
depends=('gtk-sharp-3' 'dbus-sharp-glib') 
source=(https://www.meebey.net/projects/$_pkgname/downloads/$_pkgname-$pkgver.tar.gz
        use_dbussharp_2.pc)
sha256sums=('a62ed07850a122e2bb7f2b88b32cf2fa675b60b912c0aeefb23f554ebfb1e56d'
            '6a6b13725d2b5161271f3d350e568abc2ba80130d9553089c46c4cad3bea66f9')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../use_dbussharp_2.pc
  sed -i 's/gmcs/mcs/' configure{,.ac}
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

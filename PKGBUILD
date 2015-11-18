# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=qtpass
pkgver=1.0.5
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='http://qtpass.org'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('qt5-base' 'pass' 'libxkbcommon-x11')
makedepends=('qt5-tools')
source=("https://github.com/IJHack/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e1b63f1058dc9c194f06376d52acbbb8594d429f4d7fe4ba27baed2cafe10b1c36137b3e33626c1bf33c7f3e1444e6fbe48fc66a83e0f7cd82f5b47f0193d178')

prepare() {
  sed -i 's|qtpass-icon|qtpass|' $pkgname-$pkgver/$pkgname.desktop
}

build() {
  cd $pkgname-$pkgver
  qmake-qt5
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 qtpass "$pkgdir/usr/bin/$pkgname"
  install -Dm644 artwork/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=qtpass
pkgver=0.8.5.1
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='http://qtpass.org'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('qt5-base' 'pass' 'libxkbcommon-x11')
source=("https://github.com/IJHack/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e80d3c92ec9587cb55e1ad5bd1be257665eef33cdfb42b53bf60767448ca2e6201655c40a56bfbd09c856576eaa68aeb249aa131ebc4886a0dfc034a9f6548d9')

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


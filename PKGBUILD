# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=qtpass
pkgver=1.0.3
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='http://qtpass.org'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('qt5-base' 'pass' 'libxkbcommon-x11')
source=("https://github.com/IJHack/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('1d3c66ca952a3cab4c9309af23308dfd838d32a51d12a1f425eca5faaaf174f3ca8ab89d1cbc706efa7dfc6a4cedcd128131a6cc6be92c00fec4a8ce63ea9010')

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


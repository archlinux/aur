# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=qtpass
pkgver=1.0.6
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='http://qtpass.org'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('qt5-base' 'pass' 'libxkbcommon-x11')
makedepends=('qt5-tools')
source=("https://github.com/IJHack/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('d6cf746749abf9dc7d3ac043ef13c40e7005d84e7faefe7d07bb092843fbabcfb74ca83eb8f534ba191a82a27ed2407937ee2db43be044a157d5b361cb00b21c')

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


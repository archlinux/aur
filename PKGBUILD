# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=qtpass
pkgver=0.8.2
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='http://qtpass.org'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('qt5-base' 'pass')
source=("https://github.com/IJHack/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b8092b7392132bc583513aa3fd66f05275089fd03ae7a2815f069d9ef7e469ad24fad8db2a1523fce3f45af8583a50d4fb31d4aec69db4fe7cfa8ab32d1dc23a')

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


# Maintainer: archlinux.info:tdy

pkgname=jerry
pkgver=3.0.6
pkgrel=1
pkgdesc="A chess analysis GUI"
arch=(i686 x86_64)
url=http://jerry-chess.github.io
license=(GPL)
depends=(qt5-svg)
source=(https://github.com/asdfjkl/$pkgname/archive/v.${pkgver//.}.tar.gz)
sha256sums=(f6b70ba144e7179608c85eb1455b465de7cf3a1c11f3a99be8fa63b2ee6d6811)

prepare() {
  cd $pkgname-v.${pkgver//.}
  sed -i 's/abs(/f&/; 30a\#include <cmath>' controller/mode_controller.cpp
}

build() {
  cd $pkgname-v.${pkgver//.}
  qmake-qt5 jerry3.pro
  make
}

package() {
  cd $pkgname-v.${pkgver//.}
  install Jerry -m 755 -D "$pkgdir"/opt/$pkgname/$pkgname
  find res -type f -exec install -m 644 {} -D "$pkgdir"/opt/$pkgname/{} \;
  install -m 755 -d "$pkgdir"/usr/bin/
  ln -sf /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/
}

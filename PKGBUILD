# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=rofi-calc
pkgver=1.2
pkgrel=1
pkgdesc="Do calculations in rofi"
arch=('x86_64')
url="https://github.com/svenstaro/rofi-calc"
license=(MIT)
depends=(rofi libqalculate)
install=$pkgname.install
source=(https://github.com/svenstaro/rofi-calc/archive/v${pkgver}.tar.gz)
sha512sums=('86c65f9830d9577a7b4d2168c0775d6e487008cae3c8f9d2f586fd405d59d3e25558b153dde5183408c1b35c30b904a6df58eb82eff1a98ac196ae9552dea9d8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i
  rm -rf build
  mkdir build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

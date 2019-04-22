# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=rofi-calc
pkgver=1.4
pkgrel=1
pkgdesc="Do calculations in rofi"
arch=('x86_64')
url="https://github.com/svenstaro/rofi-calc"
license=(MIT)
depends=(rofi libqalculate)
install=$pkgname.install
source=(https://github.com/svenstaro/rofi-calc/archive/v${pkgver}.tar.gz)
sha512sums=('7c00b69c623cff4a9f1b37820bbfbc13f52a172f8ac19dfba3309629760a1833ab8f604e1137d2e655d42f32c623e169cf3539c2d5d34b36ac862655f4f43ad7')

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

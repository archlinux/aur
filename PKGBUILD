# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=rofi-calc
pkgver=1.6
pkgrel=1
pkgdesc="Do calculations in rofi"
arch=('x86_64')
url="https://github.com/svenstaro/rofi-calc"
license=(MIT)
depends=(rofi libqalculate)
install=$pkgname.install
source=(https://github.com/svenstaro/rofi-calc/archive/v${pkgver}.tar.gz)
sha512sums=('a87523d3d64fbd53e431dba7da674a213fcfbdcaac25906a19bc83aa3feb14da479b702b39fd58ffeb04198ea0a5d52808f7c9c36495defc99c9c83df963e0b6')

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

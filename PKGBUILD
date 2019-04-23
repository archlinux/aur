# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=rofi-calc
pkgver=1.5
pkgrel=1
pkgdesc="Do calculations in rofi"
arch=('x86_64')
url="https://github.com/svenstaro/rofi-calc"
license=(MIT)
depends=(rofi libqalculate)
install=$pkgname.install
source=(https://github.com/svenstaro/rofi-calc/archive/v${pkgver}.tar.gz)
sha512sums=('04213b6489cd9e3c5085a88cee07ee9413819c19d4ee08f6e2eef3ad418d21b5acaf1d4ef21f1495d81694e5706f93598c91ada65f1bcc83ce94a6cf5d50ea0c')

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

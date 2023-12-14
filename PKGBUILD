# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.4.1
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('qt5-tools')
source=("https://github.com/sailfishos/mlite/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7263629e1bb0d44e3a86ecb9fb8b44d1482027638be0c060ffde470f9170d08b645e1411208377ecf9f5d7cc608599fafeb6df66c8cb235e059786c13ef51a9f')

prepare() {
  cd mlite-$pkgver
  sed -i -e 's|/usr/libexec|/usr/lib|' \
      tools/mliteremoteaction/mliteremoteaction.pro \
      tools/mliteremoteaction/main.cpp \
      src/mremoteaction.cpp
}

build() {
  cd mlite-$pkgver
  qmake-qt5 VERSION=$pkgver
  make
}

package() {
  cd mlite-$pkgver
  make INSTALL_ROOT="$pkgdir" install

  # Remove tests
  rm -r "$pkgdir/opt"
}

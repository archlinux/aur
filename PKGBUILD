# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.4.0
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('qt5-tools')
source=("https://github.com/sailfishos/mlite/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c271081e219bacf53224c583b53e38a2ca32174e91b4485b529a21dfe179f7306c2aed0a65091cbd8b60d1fe2971d59fd264dbc8bec32461525eb01d39ab25ee')

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

# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.3.8
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('qt5-tools')
source=("https://github.com/sailfishos/mlite/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8cbe1e8f216430a19465e50f9a04a6a7cedef984234ea87138963d9d1c6939006302a7cbeaa2bdc6e4fcea864bcbefc81c7f7ae2ef788b13e151b1b6397de6f7')

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

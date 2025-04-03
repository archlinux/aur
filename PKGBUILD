# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.5.3
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/sailfishos/mlite.git#tag=$pkgver")
sha512sums=('5f5adc0e3abcb4fc9b7a6f31c10e304dc0c91242ba9ce1d2b51fcb37881d1f8c6ac13ad774bbc1bc86fe910540018b850de98037a4eb7a225a56b56150e7176e')

prepare() {
  cd mlite
  sed -i -e 's|/usr/libexec|/usr/lib|' \
      tools/mliteremoteaction/mliteremoteaction.pro \
      tools/mliteremoteaction/main.cpp \
      src/mremoteaction.cpp
}

build() {
  cd mlite
  qmake-qt5
  make
}

package() {
  cd mlite
  make INSTALL_ROOT="$pkgdir" install

  # Remove tests
  rm -r "$pkgdir/opt"
}

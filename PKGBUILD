# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.5.0
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/sailfishos/mlite.git#tag=$pkgver")
sha512sums=('cd1b74e721108066708c0c107cbb28279d2fb41f9bd61226edd6550fe00e12615cc9ae11b8dcbd6e6a91f7693d7bdc4edf3b8a800818be4f353f8d76b666aee7')

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

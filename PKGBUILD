# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.5.4
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/sailfishos/mlite.git#tag=$pkgver")
sha512sums=('0db48f66878e0291a91065864b9e00e4da3cdb053223a39c08b2a52630cd992881c3b144f77b43e8433b48748150a23403dc3b3d5b0b8fb5e456bf2bfa53e4d5')

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

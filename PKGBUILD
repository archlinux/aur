# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.5.1
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/sailfishos/mlite.git#tag=$pkgver")
sha512sums=('54a5153dc9e84b28b32eedc0eb80b0cce5f370f2dac3cd173a4e04f4d1c8129f9e746427d0181361f5191215b864f1648a3d7976f4a010ada4c4c54cd36253ab')

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

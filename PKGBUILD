# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.2.26
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="http://github.com/nemomobile/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://git.merproject.org/mer-core/mlite.git#tag=$pkgver")
sha256sums=('SKIP')

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

  make INSTALL_ROOT="${pkgdir}" install

  # Remove tests
  rm -r "$pkgdir/opt"
}

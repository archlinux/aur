# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mlite
pkgver=0.4.5
pkgrel=1
pkgdesc="Useful classes originating from MeeGo Touch"
arch=('x86_64')
url="https://github.com/sailfishos/mlite"
license=('LGPL')
depends=('qt5-base' 'dconf')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/sailfishos/mlite.git#tag=$pkgver")
sha512sums=('22940fa71ececb0bdcbb9c013a009c76c0fde9bcc8709bbf35e1db75da13833df30466fb4725dff61ca862b113f7459ab796521cef21ae7173c594d512276839')

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

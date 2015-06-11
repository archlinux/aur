# Maintainer: Flávio Zavan <flavio dot zavan at gmail dot com>
pkgname=openbr
pkgver=0.5
pkgrel=1
pkgdesc="Open Source Biometrics"
arch=('any')
url="http://openbiometrics.org/"
license=('Apache')
depends=('qt5-base' 'qt5-svg' 'opencv')
makedepends=('git' 'cmake')
source=('git+https://github.com/biometrics/openbr.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  git checkout $pkgver
  git submodule init
  git submodule update

  mkdir -p build
  cd build
  cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}

# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2023.11.1
pkgrel=1
pkgdesc="Tool to manage LEGO inventory offline for BrickLink."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('hicolor-icon-theme' 'qt6-imageformats' 'qt6-multimedia' 'qt6-quick3d' 'qt6-shadertools' 'tbb')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('6a6fc3fe97daed62c04ab096e623d425d1dc529af481e15f505cc3ff3e5abe58')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-Wno-error=dangling-reference -Wno-error=nonnull" .
  cmake --build . --config Release --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install . --verbose
}

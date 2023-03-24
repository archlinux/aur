# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2023.3.2
pkgrel=1
pkgdesc="Tool to manage LEGO inventory offline for BrickLink."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt6-quick3d' 'hicolor-icon-theme' 'qt6-shadertools' 'qt6-imageformats' 'tbb')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('d202183c39e578463bcbed4531a759b2e0eb9169cde793537dfe6d69afb61d66')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  cmake --build . --config Release --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install . --verbose
}

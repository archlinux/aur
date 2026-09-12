# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2026.9.1
pkgrel=1
pkgdesc="Tool to manage LEGO inventory offline for BrickLink."
arch=('x86_64' 'aarch64')
url="https://github.com/rgriebl/brickstore"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-quick3d' 'qt6-shadertools' 'qt6-svg' 'libsecret' 'tbb')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('c14520908fb978434402b92d3eec29824103d18cbf9a88e79d54576ba72b4496')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir=/usr/src/brickstore"
  cmake --build build --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install build --verbose
}

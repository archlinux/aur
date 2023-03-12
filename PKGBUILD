# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2023.2.1
pkgrel=1
pkgdesc="Tool to manage LEGO inventory offline for BrickLink."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt6-quick3d' 'hicolor-icon-theme' 'qt6-shadertools' 'qt6-imageformats' 'tbb')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz"
        "https://github.com/rgriebl/brickstore/commit/151dd61afc41b17f01ca64bdc60e08a288d9f77e.patch")
sha256sums=('458d153b1c3394cf39c68863f51b9de05fde04c20619efa7b0d2af176b5ec735'
            '677f6d126edf8f0ba02d2fa043af4c6ee6882cb74acd7cd850e6e94fdf280316')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/151dd61afc41b17f01ca64bdc60e08a288d9f77e.patch"
}

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  cmake --build . --config Release --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install . --verbose
}

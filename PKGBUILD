# Maintainer: gardar <aur@gardar.net>

pkgname=immich-desktop
pkgver=0.2.4
pkgrel=1
pkgdesc="Unofficial native Qt desktop client for Immich"
arch=('x86_64')
url="https://github.com/hdmain/immich-desktop"
license=('MIT')
depends=('hicolor-icon-theme' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
checkdepends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3d5d8749ba78885c2760decd35a910539c53ed5f8d197aaac8dd823bf07b0db')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DIMMICH_ENABLE_UPDATER=OFF \
    -DIMMICH_EXECUTABLE_NAME=immich-desktop \
    -DIMMICH_BUILD_INFO=AUR
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

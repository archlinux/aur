# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=pinch
pkgver=0.1.0
pkgrel=1
pkgdesc='Small, fast screenshot tool: select an area, annotate it, copy or save (X11 and Wayland)'
arch=('x86_64')
url='https://github.com/ufna/pinch'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'wayland' 'noto-fonts' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake' 'qt6-tools')
checkdepends=('dbus')
conflicts=('pinch-bin' 'pinch-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66669e2ffd72c58c3181af00a162704b480e8f4d6f07af38f307b52a887aaeaf')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPINCH_WERROR=OFF
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

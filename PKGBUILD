# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=libtde
pkgver=0.1.0
pkgrel=1
pkgdesc='What TDE applications share: configuration, theme, window frame and dialogs'
arch=(x86_64 aarch64)
url='https://github.com/zskamljic/libtde'
license=(GPL-3.0-or-later)
depends=(
  glibc
  libgcc
  libstdc++
  lua
  qt6-base
  qt6-svg
)
makedepends=(
  cmake
  ninja
)
optdepends=(
  'librsvg: drawing icons that Qt draws with black patches'
  'adwaita-icon-theme: fallback for icons missing from the icon theme'
)
provides=('libtde.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e85d99ab40abab12a1917075be090bcaf70ea8204192e9541c7bed6622a063f1')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

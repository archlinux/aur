# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=libtde
pkgver=0.2.0
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
sha256sums=('e4cd5448537fb2e05a17dbed65f5d8e76a3c3f4307c4d116de2a639b799f18a5')

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

# Maintainer: lee <loyalpartner@163.com>
pkgname=fcitx5-anytalk
pkgver=0.5.2
pkgrel=1
pkgdesc="Voice input addon for fcitx5 with a Qt6 Aurora overlay"
arch=('x86_64')
url="https://github.com/yizhisec/fcitx5-anytalk"
license=('MIT')
depends=(
  'fcitx5'
  'qt6-base'
  'qt6-websockets'
  'libpulse'
)
optdepends=(
  'layer-shell-qt: Wayland-native centering on KDE/Sway/wlroots'
)
makedepends=('cmake' 'pkgconf' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('62e08019da354ddfd586534699797d2f8bb6149fb1024f35e02e6e2e7bee0856')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_OVERLAY=ON
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}

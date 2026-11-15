# Maintainer: shmall03 <shmall03@users.noreply.github.com>
pkgname=cadence-tracker
pkgver=0.1.0
pkgrel=1
pkgdesc='Track composition sessions and ideas between teaching days'
arch=('x86_64' 'aarch64')
url='https://github.com/shmall03/cadence-tracker'
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'xdg-utils')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/shmall03/cadence-tracker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f3e15500849e485f5c93588d3eb61d4338dce8ecaeaa31f57ff3fb183c8cfbc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  qmake6 "$srcdir/$pkgname-$pkgver/cadence.pro"
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/cadence "$pkgdir/usr/bin/cadence"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pkgbuild/cadence.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cadence.svg"
  install -Dm644 pkgbuild/cadence.desktop "$pkgdir/usr/share/applications/cadence.desktop"
}

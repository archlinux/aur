# Maintainer: Witek Adamus <witekadamus@gmail.com>
pkgname=nv-monitor
pkgver=1.7.1
pkgrel=1
pkgdesc="Local monitoring TUI, CSV logger, and Prometheus exporter for NVIDIA GPU systems"
arch=('x86_64' 'aarch64')
url="https://github.com/wentbackward/nv-monitor"
license=('MIT')
depends=('ncurses')
makedepends=('gcc')
optdepends=('nvidia: For GPU monitoring support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6c5625f68ba5e9a75dbd0af4ddac41bc27d49c5c97b13e17213d0377ced705c1')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS_PORTABLE="-O3 -flto -Wall -Wextra -std=gnu11 -DVERSION='\"$pkgver\"'"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 nv-monitor "$pkgdir/usr/bin/nv-monitor"
  install -Dm755 demo-load "$pkgdir/usr/bin/demo-load"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 DEMO-LOAD.md "$pkgdir/usr/share/doc/$pkgname/DEMO-LOAD.md"
  install -Dm644 PERFORMANCE.md "$pkgdir/usr/share/doc/$pkgname/PERFORMANCE.md"
}

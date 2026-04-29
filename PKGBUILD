# Maintainer: Witek Adamus <witekadamus@gmail.com>
pkgname=nv-monitor
pkgver=1.12.0
pkgrel=1
pkgdesc="Local monitoring TUI, CSV logger, and Prometheus exporter for NVIDIA GPU systems"
arch=('x86_64' 'aarch64')
url="https://github.com/wentbackward/nv-monitor"
license=('MIT')
depends=('ncurses')
makedepends=('gcc')
optdepends=('nvidia: For GPU monitoring support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b0342507deb9f3359655af08c10acadd388f5bebb3a9305bf3a6d2bc2ac9ccf')

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

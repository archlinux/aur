# Maintainer: Kyobe Kitsugari <kyobekitsugari@gmail.com>
pkgname=autosync
pkgver=1.0.2
pkgrel=1
pkgdesc="A robust, multi-directional sync orchestrator using rclone bisync with auto-healing."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/alukhia/autosync"
license=('GPL3')
depends=('rclone')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('42e31e2e4e46f03b9c5d16bb6bdecb33a451f9ffe2a1526e365dfa51875c1114')
install="$pkgname.install"

build() {
  # Adicionado o 'v' antes do $pkgver
  cd "$pkgname-v$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  # Adicionado o 'v' antes do $pkgver
  cd "$pkgname-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "systemd/autosync.service" "$pkgdir/usr/lib/systemd/user/autosync.service"
  install -Dm644 "systemd/autosync.timer" "$pkgdir/usr/lib/systemd/user/autosync.timer"
}

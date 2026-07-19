# Maintainer: Yousef Alharbi <yo2w86@gmail.com>
pkgname=nmrs-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast Vim-friendly NetworkManager TUI built in Rust."
arch=('x86_64')
url="https://github.com/y2w8/nmrs-tui"
license=('GPL-3.0-only')
depends=('networkmanager')
makedepends=('rust')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/y2w8/nmrs-tui/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('1c92a9cac68c0908bb70469b46a38271993875920aa012056f6561aa5aa78233')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/nmrs-tui "$pkgdir/usr/bin/nmrs-tui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

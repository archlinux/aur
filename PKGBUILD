# Maintainer: Fangjian Jin <askme@163.com>

pkgname=stochos
pkgver=1.0.0
pkgrel=1
pkgdesc='Keyboard-driven mouse control overlay for Wayland and X11'
arch=('x86_64' 'aarch64')
url='https://github.com/museslabs/stochos'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'libx11' 'libxtst' 'wayland')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e0f527de68e276b069a01942ca4814426439c00d98f5e622d1a477d77fd23e3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/stochos" "$pkgdir/usr/bin/stochos"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

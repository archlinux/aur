# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse
pkgver=0.1.9
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles"
arch=('x86_64' 'aarch64')
provides=('ccuse-bin')
conflicts=('ccuse-bin')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wjsoj/ccuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4322e03736fc2e7df00f33467052ebdf3f8c0651fcd9ef5305fb0df0d055f2b3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/ccuse" "$pkgdir/usr/bin/ccuse"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

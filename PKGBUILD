# Maintainer: wjsoj <wjs@wjsphy.top>

pkgname=ccuse
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI tool to manage and switch between Claude Code profiles"
arch=('x86_64' 'aarch64')
url="https://github.com/wjsoj/ccuse"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wjsoj/ccuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef9da2a6144f2165df72fab3601af16a3fdc1e023f744f613a377754aa1e71c8')

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

# Maintainer: Kyohei Uto <kyoheiu@outlook.com>
pkgname=felix-rs
pkgver=0.4.2
pkgrel=1
pkgdesc="tui file manager with vim-like key mapping, written in Rust"
arch=('x86_64')
url="https://github.com/kyoheiu/felix"
license=('custom:MIT')
depends=(gcc-libs)
makedepends=(cargo)
source=("felix-$pkgver.tar.gz::https://github.com/kyoheiu/felix/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "felix-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "felix-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/felix-$pkgver/target/release/fx"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/felix-$pkgver/LICENSE"
}

sha256sums=('cd3fcc5832c96180a54f60f431021006a3e5c569247fc64a9ac3d69bfd43ca19')

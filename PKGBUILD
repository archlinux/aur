# Maintainer: Kyohei Uto <kyoheiu@outlook.com>
pkgname=felix-rs
pkgver=0.3.0
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

sha256sums=('08bf46dadf65738ac172718f3a117b87974b2b805d787cb1d5e7397a3b5432bb')

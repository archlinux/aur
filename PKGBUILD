# Maintainer: Max1Truc <max1truc @ disroot dot org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=magic-wormhole.rs
pkgname=wormhole-rs
pkgver=0.5.0
pkgrel=1
pkgdesc='Rust implementation of Magic Wormhole, with new features and enhancements'
arch=(x86_64)
url="https://github.com/magic-wormhole/$_pkgname"
license=('custom:EUPL-1.2+')
depends=(libxcb)
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('fdd1d0bd00948f9bdce28b7d21e84bebd25d08502efe30408ded91a150afa5ce')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_archive"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EUPL-1.2" LICENSE
}

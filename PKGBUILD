# Maintainer: Max1Truc <max1truc @ disroot dot org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=magic-wormhole.rs
pkgname=wormhole-rs
pkgver=0.6.0
pkgrel=1
pkgdesc='Rust implementation of Magic Wormhole, with new features and enhancements'
arch=(x86_64)
url="https://github.com/magic-wormhole/$_pkgname"
license=('custom:EUPL-1.2+')
depends=(libxcb)
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('cfa72215b1b0f519b9986523d0c41d6b3e562c41668f28ee80c23ce0aa3fe685')

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

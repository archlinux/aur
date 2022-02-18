# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-zigbuild
pkgver=0.4.1
pkgrel=1
pkgdesc="Compile Cargo project with zig as linker"
url="https://github.com/messense/cargo-zigbuild"
license=("MIT")
arch=('x86_64' 'i686')
depends=('gcc-libs' 'zig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/messense/cargo-zigbuild/archive/refs/tags/v$pkgver.tar.gz")
cksums=('3268992820')
sha256sums=('abf4b5c15173b14c1e4e9d188407989773b55017eb5d3cfe6d9364a8710b50c6')
b2sums=('dc1dad2770be65cf445809a71a84ec3f59d4aae900540da74b5d6385b5dbad544b8c5c06b14df35947511a71d3a2471b2dd9c4b65145f0d0f1d303767866854c')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-zigbuild

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

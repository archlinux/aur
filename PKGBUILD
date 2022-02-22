# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-zigbuild
pkgver=0.5.3
pkgrel=1
pkgdesc="Compile Cargo project with zig as linker"
url="https://github.com/messense/cargo-zigbuild"
license=("MIT")
arch=('x86_64' 'i686')
depends=('gcc-libs' 'zig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/messense/cargo-zigbuild/archive/refs/tags/v$pkgver.tar.gz")
cksums=('897372017')
sha256sums=('eaca923e917f3f369d551446d565f75cfa784b48ef03bf42a385fd371bd0cbaf')
b2sums=('ae04417e27fde161a12daceef4135d88779282346f985a7884008c5df15c963e863b71c84e29f88ccb4f76fdb73267c1b2306b19c782cf1ef83bd6846a0512d9')

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

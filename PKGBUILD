# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-zigbuild
pkgver=0.2.3
pkgrel=1
pkgdesc="Compile Cargo project with zig as linker"
url="https://github.com/messense/cargo-zigbuild"
license=("MIT")
arch=('x86_64' 'i686')
depends=('gcc-libs' 'zig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/messense/cargo-zigbuild/archive/refs/tags/v$pkgver.tar.gz")
cksums=('2494941666')
sha256sums=('ed9d23fb096ea005f62447dbb75a458d66a11c3b9310249b6ab150385984bd96')
b2sums=('ee33da8a518713c5f197e69eca50f855e68eef16567d9e20c2afe97646097c56504fc63ef1f5f38895043876f48c827d48b8435623d17107e30a1d667164d235')

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

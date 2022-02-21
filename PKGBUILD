# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-zigbuild
pkgver=0.5.0
pkgrel=1
pkgdesc="Compile Cargo project with zig as linker"
url="https://github.com/messense/cargo-zigbuild"
license=("MIT")
arch=('x86_64' 'i686')
depends=('gcc-libs' 'zig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/messense/cargo-zigbuild/archive/refs/tags/v$pkgver.tar.gz")
cksums=('1192237814')
sha256sums=('9d57434093e3ce834f8e903650d6aa4767bb457a2b76f660f8d7a3b247f0547c')
b2sums=('d51fef49a4f4a9a00ad9388923568574c8111daaa8490713677bf666ba1096f839e2ef6de5538decb5aaabf124951a9b59f146d343a352fd520a924ef7543feb')

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

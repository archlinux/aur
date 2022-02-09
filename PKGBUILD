# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rnix-lsp
pkgver=0.2.4
pkgrel=1
pkgdesc="A Language Server for Nix"
url="https://github.com/nix-community/rnix-lsp"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('git' 'cargo')
conflicts=('rnix-lsp-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
cksums=('2987763063')
sha256sums=('0b1cac474fa81ebd4b4ffb3016ad0f7fe1a093ebf29b6f13caa18818f6cce8cb')
b2sums=('0881b662ba812f07e6e0fb62c66a5058287a80d3ba33d8c57ff956ff32a5be20d4c60aed44583704dc70c2e493074725f386069ed9da26583978a1a3def717ec')

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
    target/release/rnix-lsp

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

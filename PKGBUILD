# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rnix-lsp
pkgver=0.2.5
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
cksums=('3161437623')
sha256sums=('a689df1bce76d3b7f742cc37e13ba06d2c5cf69cda1bddbe1d15e434b6b223b5')
b2sums=('eb70646c595d8fb70f0ffc1c63b84de0e5bd6e161a23669bfca043de470afc3a66d1a44fe00ca652e98c9243a26f0d0dc78abe5f527ec7262d10d1d41452b2b2')

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

# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rnix-lsp
pkgver=0.2.1
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
cksums=('3756739719')
sha256sums=('21586957643d14d1bc4dfc7a6fca436f95e0d3e3e43619696dd9ec4ca66924cf')
b2sums=('3627b6dd0b9365bd5d2bfc500334be0e1cee2473e261e38072182e62fe5bb4dcdfaf3ef7af6df35aedb553f98e5c11189bb0d7b4280a3fa08e18b78153cb9bd2')

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

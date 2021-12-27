# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rnix-lsp
pkgver=0.2.3
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
cksums=('3737277326')
sha256sums=('807964256518ff0594deee73c24cc55155c83707f88eb133e53057ae954a8d0a')
b2sums=('e5e5a74e659cf0959ae413b919382989a9f01bbb1ceb61e13cb1974b4897ac099ff76c6ff49d1978d2d7f413edbe6d4a4f5938a9f38da09b08907ecc0d75fe52')

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

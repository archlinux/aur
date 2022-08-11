# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-wapm
pkgver=0.1.3
pkgrel=1
pkgdesc="Cargo sub-command for publishing Rust crates to the WebAssembly Package Manager"
url="https://github.com/Michael-F-Bryan/cargo-wapm"
license=('Apache')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Michael-F-Bryan/cargo-wapm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8806ff9162bcea75b1c409a9a143740f8363bc44c0b17faccfe9f425e1268d06')
b2sums=('bb4d966388d72e519e4e4ca6e1aaa209448484e2a337f506c1050fddb27f0f74ea02fca5116e7c4ad06722b9bf41a1c111707d8835b2365050615f52c77f6478')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-wapm

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

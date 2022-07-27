# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=gitoxide
pkgver=0.13.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/gitoxide"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Byron/gitoxide/archive/refs/tags/v$pkgver.tar.gz")
cksums=('3985154960')
sha256sums=('9ea8049062dad8c5429ba3548d7f859f3991d5640f5c018254036d3af5843d91')
b2sums=('3fdd71d2ab463b5cdceab2f04b18b7557305e7aa8a7cffa5fa4cde54e26d6a25fb6619d5566045668479b63dce734796cbed4ff9cecb21e5d522a55f4ad369b1')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'max'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/gix target/release/ein

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}

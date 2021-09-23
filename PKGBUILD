# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=pipe-rename
pkgver=1.4.0
pkgrel=1
pkgdesc='Rename your files using your favorite text editor'
url='https://github.com/marcusbuffett/pipe-rename'
arch=('x86_64' 'i686')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcusbuffett/pipe-rename/archive/${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
cksums=('3596003686')
sha256sums=('b9b3db9461b126c9e12ccd0896f5f3f12f1f0bc30b552da4e9685ce17ebb2609')
b2sums=('cf6d6f4df4ae89dc962e4ff386c02a518d926d0a816de8ddbac347d1011507e8d6806ece0295a10394cc207dde85f7af3af8e12b86ca8c65a8c42a8d82468ecd')

prepare() {
  cd "$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN="stable" \
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN="stable" CARGO_TARGET_DIR="target" \
    cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN="stable" \
    cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 target/release/renamer "$pkgdir/usr/bin/pipe-rename"
}

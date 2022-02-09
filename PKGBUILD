# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=pipe-rename
pkgver=1.4.1
pkgrel=1
pkgdesc='Rename your files using your favorite text editor'
url='https://github.com/marcusbuffett/pipe-rename'
arch=('x86_64' 'i686')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcusbuffett/pipe-rename/archive/${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
cksums=('221640552')
sha256sums=('1dd5ad44cbdd7024b7a079cf97b36791e2c1359d8f9fb11211e95332841e8860')
b2sums=('0b1f5da8f843c80dae81828d8560bfd8061cc8bf464836fbe86e34d386b94c6e671f7b4a917380f2a36762b14f1af040a22ee699ae7f3db72cbdc88f4e4e380e')

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

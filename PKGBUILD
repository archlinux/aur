# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rsign2
pkgver=0.6.2
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures."
url="https://github.com/jedisct1/rsign2"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('0e9b14ed750d177081e32fb7d52e04e4dd4f4a72d224a4ab78a1431260c8ecc4')
b2sums=('0fd7b293e9c6226710159014f479cee47614be0334a45a1da2c0c519f6d2075c9c532400cbffbc232407fafb4402ae4d2f50329b423691d79fd07473ffd77d87')

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
    target/release/rsign

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

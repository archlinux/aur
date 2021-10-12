# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rsign2
pkgver=0.6.1
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures."
url="https://github.com/jedisct1/rsign2"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
cksums=('3676599369')
sha256sums=('4bc885b04af13c05ed09665541a7b578454259d9e5fd896c5dda3536a4b03127')
b2sums=('0b98c9d70278266a5f3b70d1e2c841ea4929d3b91d30fa3a5fb7ab2e85853582a5e39810795b0ce22fca9e5b98ca253c58cc3e00b252ce4d669ef6c0224fa9f8')

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

# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rsign2
pkgver=0.6.5
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures."
url="https://github.com/jedisct1/rsign2"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('1fd796b2662ab718e125565c6664ffb34b48bb5de6ee19578282e82e50875046')
b2sums=('20f717691d3235430177ee5567f699c47aff60a9542f84474cd02a20f332a2415f2572bd08d486fb3970cf609f1cf24c58f75f674f227c136efe580b253f5b3b')

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

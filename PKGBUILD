# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rsign2
pkgver=0.6.4
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures."
url="https://github.com/jedisct1/rsign2"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('03668b0d84b16e72ee2a34eba5badbd03f19c8c8916a46465c23e999831b7eb1')
b2sums=('b8b38266d90ed097d34d4e13d028be07e6ca45546de47b26b75e71c8c214f41717b50291ebb535079d1730350bf79cd53e1520eb618ea964b084b8759b05761e')

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

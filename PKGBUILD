# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=rsign2
pkgver=0.6.3
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures."
url="https://github.com/jedisct1/rsign2"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('dd714e5954c122f7b6eb9c740416afd49a43eaf38996f01c0c12c82bfd3f7620')
b2sums=('9e7ad47150758f279651c3aa84ebb5a61f7bb9bf6bb4db108ab1fa8f33c1f20bc9b03d594e9b87e02c34de1921ca85c5d9c79124f52c5029e24564d8981002bc')

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

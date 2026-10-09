# Maintainer: rnestler

pkgname=attractorr
pkgver=0.7.2
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('fcf256d6fcba239f4ab65a3f26cab9ee69ec188728c2f6c1c6ae64a916cbedb1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

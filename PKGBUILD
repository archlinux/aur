# Maintainer: rnestler

pkgname=attractorr
pkgver=0.5.2
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('d9f027846a266937efa8d86dea66e664ae385245ee8d38950a2895762bf648a2')

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

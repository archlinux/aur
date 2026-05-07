# Maintainer: rnestler

pkgname=attractorr
pkgver=0.7.1
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('4358607aef585650e58a7d874f379cd5b9825a9fe6129b9d1aac783765a6d7c1')

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

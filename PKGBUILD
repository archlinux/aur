# Maintainer: David Somers <red.zone7953@jalada.co.uk>
pkgname=gdrive-search
pkgver=0.1.0
pkgrel=2
pkgdesc="A TUI to quickly find files in your Google Drive"
arch=(x86_64)
url="https://github.com/jalada/gdrive-search"
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('961bc9ce07f37c4cdd6dcf3451b316270f78841273345be103a0ed295022ddf6df057df6c0870997f0085d0db95844965eddee225beea38c2bde849667ff43e1')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd $pkgname-$pkgver
  cargo build --release --frozen --all-features
}

check() {
  # For now gdrive-search has no tests
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname-$pkgver
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/$pkgname
}

# Maintainer: EnokiUN (Enoki) <enokiun@gmail.com>

pkgname='eludris'
pkgver=0.3.3
pkgrel=1
pkgdesc='A simple CLI to help you with setting up and managing your Eludris instance'
arch=('any')
url='https://github.com/eludris/eludris'
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('51e22cd2ca7e640ce6db60bc75d7e8ba6b1e2318d1e8c33eb5896378fc099fd6363fa07a274c5f70c2bc9a507bcad2a9262264dd9ea53f55f873a8d67d78e3ea')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

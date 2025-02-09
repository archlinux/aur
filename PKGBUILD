# Maintainer: Aaron Kaiser <a_kaiser+arch at posteo dot de>

pkgname=age-plugin-xwing
pkgver=0.2.0
pkgrel=0
pkgdesc='X-Wing plugin for age'
arch=(x86_64)
url="https://github.com/Rixxc/$pkgname"
license=('MIT')
depends=()
makedepends=(cargo)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('295c24a6f94c248d5a2b62c5d9a38213508d49cb43c07b417a580343f68107a4')

prepare() {
  cd "age-plugin-xwing-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "age-plugin-xwing-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "age-plugin-xwing-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE
}

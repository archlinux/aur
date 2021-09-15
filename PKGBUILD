# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=starlark-rust
_pkgname=starlark
pkgver=0.5.0
pkgrel=1
pkgdesc="Rust implementation of the Starlark language"
arch=('x86_64')
url="https://github.com/facebookexperimental/starlark-rust"
license=('Apache')
depends=('gcc-libs')
makedepends=('rustup')
provides=('starlark')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookexperimental/starlark-rust/archive/v$pkgver.tar.gz")
sha512sums=('769fc64864764693b6388a2cfffd61353e3df2903293fd4713736f02fcecff18dcd3908ee5b8d36a6d0194698a056f081d853b620739fc2caeb1aa455ae5ffa1')
b2sums=('66b64be38e8fbfa5c278d262a6c9ad68b1c12feff322eea85e2cffd3aba3ee438684c60834cc36a532ecf1b608ea2c65df3259d6b45215c083060c926e5d698b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/starlark

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

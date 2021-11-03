# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch
pkgver=0.3.1
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal"
arch=('x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('269abaf5ac2f80da3796dbf5e73419c1b64104d1295f3ff57965141f079e6f6d')

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

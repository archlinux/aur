# Maintainer: EnokiUN (Enoki) <enokiun@gmail.com>

pkgname='pilfer'
pkgver=0.3.3
pkgrel=1
pkgdesc='A simple TUI frontend for Eludris'
arch=('any')
url='https://github.com/eludris/pilfer'
license=('MIT')
depends=('openssl')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('23126c47e1cb95c6cf33dd6533d70ae66f71d4833d280191415152527efbf4350e9be14f6980991c5a66c3b66f3c70edd46492c1b40214d776229eb2bcc39676')

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

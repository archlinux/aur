# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=notion2pandoc
pkgver=0.5.1
pkgrel=1
pkgdesc="Notion page -> Pandoc AST "
arch=('x86_64')
url="https://github.com/ho-oto/notion2pandoc"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ho-oto/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('debde49736a9b4864c6c64c059fb75083f390ad1e064f19de539da0be0e3aabe7b45cb13e526caef609e0a0f413973bd5b3dc0c51417b9926f9be2c7d52d7364')

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

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

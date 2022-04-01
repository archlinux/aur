# Maintainer: Chess7th <chess7th@pm.me>

pkgname='rusty-warrior'
pkgver=v1.1.0
pkgrel=1
depends=('task' 'dunst')
makedepends=('cargo')
pkgdesc='A simple notification system for Taskwarrior made in Rust'
arch=('any')
url="https://git.sr.ht/~chess7th/$pkgname"
license=('GPL3')
provides=("${pkgname%*}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3e63e9fe5781dafe5eb4564e4e4d516737e931e1dfd78c2aa40bc5a5573e8390')

prepare() {
  cd "${pkgname%*}-${pkgver}"
  cargo fetch --offline --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${pkgname%*}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname%*}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname%*}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

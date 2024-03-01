# Maintainer: Doug Elkin <aur@dougelkin.com>

pkgname=gmocli
pkgver=1.1.0
pkgrel=1
pkgdesc="command-line interface for searching emoji characters with associated gitmoji descriptions"
url='https://github.com/duhdugg/gmocli'
license=('MIT')
arch=(x86_64)
depends=()
optdepends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('482f81e509cc8694c5f9a39215a1e6d87437f621efc1a9afd0517ff5f33a923a')

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
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "data/emoji/unicode-license.txt" "$pkgdir/usr/share/licenses/$pkgname/thirdparty/unicode-license.txt"
  install -Dm0644 "data/gitmoji/gitmoji-license.txt" "$pkgdir/usr/share/licenses/$pkgname/thirdparty/gitmoji-license.txt"
}

# Maintainer: Doug Elkin <aur@dougelkin.com>

pkgname=emocli
pkgver=0.8.6
pkgrel=1
pkgdesc="command-line interface for searching emoji characters"
url='https://github.com/duhdugg/emocli'
license=('MIT')
arch=(x86_64)
depends=()
optdepends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('78912d47f74dc03cd8c9a244a1ddca9b4e6a79c45fd4cfff0a6881a79b6f68d4')

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

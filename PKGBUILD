# Maintainer: Algorant
pkgname=tandem
pkgver=0.3.0
pkgrel=1
pkgdesc='Local-first CLI/TUI for human and agent project coordination'
arch=('x86_64')
url='https://github.com/Algorant/tandem'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/tandem-v$pkgver.tar.gz")
sha256sums=('4632755f7af8d5b97bfd797dcd842046fa9e38ae469902abee0e1fc3cdbe4050')

prepare() {
  cd "$pkgname-tandem-v$pkgver/tandem"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-tandem-v$pkgver/tandem"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "$pkgname-tandem-v$pkgver/tandem"
  export CARGO_TARGET_DIR=target
  cargo test --locked
}

package() {
  cd "$pkgname-tandem-v$pkgver"
  install -Dm755 "tandem/target/release/tandem" "$pkgdir/usr/bin/tandem"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 tandem/README.md "$pkgdir/usr/share/doc/$pkgname/tandem-README.md"
}

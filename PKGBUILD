# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>

pkgname=emacs-lsp-booster
pkgver=0.2.1
pkgrel=1
pkgdesc='Emacs LSP performance booster'
url='https://github.com/blahgeek/emacs-lsp-booster'
arch=('x86_64')
makedepends=('cargo')
license=('MIT')
install=$pkgname.install
source=("https://github.com/blahgeek/emacs-lsp-booster/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a6fa6ce99375c15158875c47d80734267d0a71dd1e5afd37c4e5f5ffe679562')


build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 target/x86_64-unknown-linux-gnu/release/emacs-lsp-booster "$pkgdir/usr/bin/emacs-lsp-booster"
}

# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wapm
pkgver=0.2.0
pkgrel=1
pkgdesc="WebAssembly Package Manager"
arch=('x86_64')
url="https://wapm.io"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/wasmerio/wapm-cli/archive/v${pkgver}.tar.gz)
sha512sums=('4df65b180981b4c6283473e429aa9171ac1b72db36d1629a97230af40ea8cdfb588e32061264170712c69e1cdcef298691214d00c781c6557dfa4d5d177152e2')

build() {
  cd "$srcdir/wapm-cli-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/wapm-cli-$pkgver"

  cargo test
}

package() {
  cd "$srcdir/wapm-cli-$pkgver"

  cargo install --root "$pkgdir"/usr --path .
  rm "$pkgdir"/usr/.crates.toml
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

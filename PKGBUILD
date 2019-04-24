# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wapm
pkgver=0.1.0
pkgrel=1
pkgdesc="WebAssembly Package Manager"
arch=('x86_64')
url="https://wapm.io"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/wasmerio/wapm-cli/archive/v${pkgver}.tar.gz)
sha512sums=('727846ff658ce067b7db0e790530ef8af7cd99c80e117d57ab833d5585fb56d6bd68bfb4ca5091b2816bef827bf5edbbedacc7d6cf12c27606d92bf11076629e')

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

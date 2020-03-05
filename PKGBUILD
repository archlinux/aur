# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wapm
pkgver=0.4.3
pkgrel=1
pkgdesc="WebAssembly Package Manager"
arch=('x86_64')
url="https://wapm.io"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/wasmerio/wapm-cli/archive/${pkgver}.tar.gz)
sha512sums=('4321b3278fb7f78d1f5147e80ee00c75b52a3c79d26cb46a19487f686942c882b0929e093195f5245f677197faabfe3980e1f3361a78ad6dca80544cf2c7fdbf')

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

# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wapm
pkgver=0.4.1
pkgrel=1
pkgdesc="WebAssembly Package Manager"
arch=('x86_64')
url="https://wapm.io"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/wasmerio/wapm-cli/archive/${pkgver}.tar.gz)
sha512sums=('b76d13d6e82c15e999217a226c4c477d079e4b1e3e8a43d4aede597f7c52a5d61c6d6bb0bf84c425cf8633e8ef532ee78f91edc97e29db230bde42dec07f0ef2')

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

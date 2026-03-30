pkgname=swagsh
pkgver=0.5.1
pkgrel=2
pkgdesc="A really small shell that aims to be fast and posix-compatible"
arch=('x86_64')
url="https://github.com/takashialpha/swagsh"
license=('Apache-2.0')
makedepends=('cargo')

source=("git+https://github.com/takashialpha/swagsh.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/swagsh"

  # Use --locked for reproducible builds
  cargo build --release # --locked
}

package() {
  cd "$srcdir/swagsh"

  # Install the binary
  install -Dm755 target/release/swagsh "$pkgdir/usr/bin/swagsh"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Optional: install README if useful
  # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

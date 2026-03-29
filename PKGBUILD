pkgname=audium
pkgver=0.8.1
pkgrel=1
pkgdesc="Terminal music app built in Rust"
arch=('x86_64')
url="https://github.com/takashialpha/audium"
license=('Apache-2.0')
depends=('alsa-lib')
makedepends=('cargo' 'alsa-lib')

source=("git+https://github.com/takashialpha/audium.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/audium"

  # Use --locked for reproducible builds and to respect Cargo.lock
  cargo build --release #--locked
}

package() {
  cd "$srcdir/audium"

  # Install the binary
  install -Dm755 target/release/audium "$pkgdir/usr/bin/audium"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Optional: install README if useful
  # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

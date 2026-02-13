# Maintainer: limforge
pkgname=noorfetch
pkgver=2.0.0
pkgrel=1
pkgdesc="Minimal and fast system information fetch tool written in Rust"
arch=('x86_64')
url="https://codeberg.org/limforge/noorfetch"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9af4b842ff487c7ad7b05cbc45d07b904b7056e22ba8f6c6daceda2ec739f054')

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  cargo install --frozen --root "$pkgdir/usr" --path . --no-track
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

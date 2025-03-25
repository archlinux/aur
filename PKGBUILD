# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=papa
pkgver=4.1.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar"
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
arch=('x86_64')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d1d9049ee934c6690afd59cc16e7b21b8489019ad57fc97291be7da009c0381')

prepare() {
  cd papa-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd papa-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd papa-$pkgver
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/papa"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/papa"
  install -Dm755 target/release/papa -t "$pkgdir/usr/bin"
}

# Maintainer: limforge
pkgname=noorfetch
pkgver=2.1.0
pkgrel=1
pkgdesc="Minimal and fast system information fetch tool written in Rust"
arch=('x86_64')
url="https://codeberg.org/limforge/noorfetch"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
source=("https://codeberg.org/limforge/noorfetch/archive/2.1.0.tar.gz")
sha256sums=('af1b3093fe8f039ccd1c1a5d074f874a7590833d8c07e14c3562e303289684f9')

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

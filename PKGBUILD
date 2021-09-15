# Maintainer: Samyak <saaamtaaan(one)(zero)(six)+aursfps(at)gmail.com> (replace "aaa" with "a")

pkgname=sixtyfps-lsp
pkgver=0.1.2
pkgrel=1
pkgdesc='An implementation of the LSP server for SixtyFPS featuring diagnostics, code completion, goto definition, and more importantly, live-preview'
url='https://github.com/sixtyfpsui/sixtyfps'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sixtyfpsui/sixtyfps/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('custom')
makedepends=('cargo')
sha256sums=('17da8b37eab3f56b597bd84457bc2632567a976d0f0f99aa37df2d4f218dd726')

prepare() {
  cd "$srcdir/sixtyfps-$pkgver/tools/lsp"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build () {
  cd "$srcdir/sixtyfps-$pkgver/tools/lsp"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/sixtyfps-$pkgver"

  install -Dm755 tools/lsp/target/release/sixtyfps-lsp "${pkgdir}/usr/bin/sixtyfps-lsp"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

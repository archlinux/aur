# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>

pkgname=polylux2pdfpc
_reponame=polylux
_dirname=pdfpc-extractor
pkgver=0.4.0
pkgrel=1
pkgdesc='pdfpc extractor for polylux, a package for creating slides in Typst'
arch=(x86_64)
url='https://github.com/polylux-typ/polylux'
license=(MIT)
depends=(typst)
makedepends=(git cargo)
optdepends=('pdfpc: Present the generated speaker notes using the presenter console')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path "$_reponame/$_dirname/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --frozen --manifest-path "$_reponame/$_dirname/Cargo.toml" --release
}

package() {
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Package licenses
  install -Dm644 "$_reponame/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash
pkgver=0.5.1
pkgrel=1
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils' 'libx11' 'libxext' 'libxft' 'libxinerama' 'libxcursor' 'libxrender' 'libxfixes' 'pango' 'cairo' 'libgl' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-stable.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/estash" -t "$pkgdir/usr/bin"
  install -Dm 644 docs/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

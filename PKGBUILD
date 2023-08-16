# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=yazi
pkgver=0.1.3
pkgrel=1
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O."
url="https://github.com/sxyazi/yazi"
arch=("x86_64")
license=("MIT")
depends=(gcc-libs ttf-nerd-fonts-symbols)
optdepends=(
    'jq: for JSON preview'
    'unarchiver: for archive preview'
    'ffmpegthumbnailer: for video thumbnails'
    'fd: for file searching'
    'ripgrep: for file content searching'
    'fzf: for directory jumping'
    'poppler: for PDF preview'
    'zoxide: for directory jumping')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sxyazi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e6738a12896ff0ab081a306e6334702a93dcb1039e4c596eb6ee723a6bc037cc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$pkgname"-$pkgver
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


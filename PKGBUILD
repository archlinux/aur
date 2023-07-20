# Maintainer: Pig Fang <g-plane@hotmail.com>

pkgname=yazi
pkgver=0.1.0
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
    'zoxide: for directory jumping')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sxyazi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('130b40b0f3ae04ef33970e0f461e4eeb7b25c3fb059fc8d528c2de8ef646b755')

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


# Maintainer: Siddhesh Lakhani <lakhani.siddhesh@gmail.com>
pkgname=glyph-ocr
_pkgname=glyph
pkgver=0.1.0
pkgrel=1
pkgdesc="Blazing-fast, minimal Wayland screen OCR & text sniper"
arch=('x86_64')
url="https://github.com/sid-lakhani/glyph"
license=('MIT')
depends=('slurp' 'grim' 'wl-clipboard')
optdepends=(
    'tesseract: Full OCR text recognition'
    'tesseract-data-eng: English OCR language training dataset'
)
makedepends=('cargo' 'rust')
provides=('glyph')
conflicts=('glyph' 'glyph-ocr-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --locked
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: Atharva Surwase <atharvasurwase@gmail.com>

pkgname=text-extractor
pkgver=0.1.0
pkgrel=3
pkgdesc="A Rust-based text extractor using Tesseract OCR and Iced GUI"
arch=('x86_64')
url="https://github.com/Top-g-hash/Monte-Capcho"
license=('MIT' 'Apache')

depends=(
  'tesseract'
  'leptonica'
  'zstd'
  'slop'   # X11 region selection
  'maim'   # X11 screenshot
  'slurp'  # Wayland region selection
  'grim'   # Wayland screenshot
)

makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
 cd "$srcdir"
  export RUSTFLAGS="-C link-args=-lonig -lzstd"
  cargo build --release --locked
}

package() {
  cd "$srcdir"
   # Install the binary
    install -Dm755 "target/release/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"

        # Install fonts
    install -Dm644 "fonts/ocr-icons.toml" \
        "$pkgdir/usr/share/text-extractor/fonts/ocr-icons.toml"
    install -Dm644 "fonts/ocr-icons.ttf" \
        "$pkgdir/usr/share/text-extractor/fonts/ocr-icons.ttf"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop file
  install -Dm644 "assets/text-extractor.desktop" \
    "$pkgdir/usr/share/applications/text-extractor.desktop"

  # Install icon
  install -Dm644 "assets/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/text-extractor.png"

}


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
  'oniguruma'
  'slop'
  'maim'
  'slurp'
  'grim'
)

makedepends=('cargo' 'pkgconf')

source=("$pkgname-$pkgver.tar.gz")
sha256sums=('89733efd739c73d0ee694b059d871c9beb1cfacdd9de021a6e553882f29011db')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "fonts/ocr-icons.toml" "$pkgdir/usr/share/text-extractor/fonts/ocr-icons.toml"
  install -Dm644 "fonts/ocr-icons.ttf" "$pkgdir/usr/share/text-extractor/fonts/ocr-icons.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "assets/text-extractor.desktop" "$pkgdir/usr/share/applications/text-extractor.desktop"
  install -Dm644 "assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/text-extractor.png"
}


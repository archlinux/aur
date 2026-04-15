# Maintainer: Atharva Surwase <atharvasurwase@gmail.com>

pkgname=MonteCapcho
pkgver=0.1.1
pkgrel=1
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

makedepends=('cargo' 'pkgconf' 'oniguruma')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Top-g-hash/Monte-Capcho/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d672f62882ee488533d2d4886f97de66b31e30a2e54cfc30c60eeb9805af34c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --locked
}

package() {
  cd "$srcdir/MonteCapcho-$pkgver"

  install -Dm755 target/release/text-extractor \
    "$pkgdir/usr/bin/MonteCapcho"

  install -Dm644 fonts/ocr-icons.toml \
    "$pkgdir/usr/share/MonteCapcho/fonts/ocr-icons.toml"

  install -Dm644 fonts/ocr-icons.ttf \
    "$pkgdir/usr/share/MonteCapcho/fonts/ocr-icons.ttf"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 assets/text-extractor.desktop \
    "$pkgdir/usr/share/applications/MonteCapcho.desktop"

  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/MonteCapcho.png"
}


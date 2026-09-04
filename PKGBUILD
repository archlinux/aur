# Maintainer: Yasir <https://github.com/sirrryasir>
pkgname=shotdock
pkgver=0.1.1
pkgrel=1
pkgdesc="Modern floating screenshot and screen recording toolbar for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/sirrryasir/shotdock"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'grim' 'slurp' 'imagemagick' 'wl-clipboard' 'libnotify')
optdepends=(
    'tesseract: OCR text extraction'
    'tesseract-data-eng: English language support for OCR'
    'wf-recorder: Screen and region video recording'
    'swappy: Screenshot annotation editor'
)
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e683311ddcc67aebbb73db1ae502f0b9ee6fd8751eae82e129e1c80fd0697450')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-targets
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Yasir <https://github.com/sirrryasir>
pkgname=shotdock
pkgver=0.1.4
pkgrel=1
pkgdesc="Automated window framing, soft drop shadows, and studio screen capture for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/sirrryasir/shotdock"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'grim' 'slurp' 'imagemagick' 'wl-clipboard' 'libnotify')
optdepends=(
    'hyprpicker: Screen freeze during area selection'
    'tesseract: OCR text extraction'
    'tesseract-data-eng: English language support for OCR'
    'wf-recorder: Screen and region video recording'
    'satty: Screenshot annotation editor'
    'swappy: Screenshot annotation editor fallback'
    'rofi: Interactive display and window recording menu'
)
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e755405e8453e9850074b41f53c68912632543315a71228155ef6c2d619cd5cf')

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

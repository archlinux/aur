# Maintainer: Bonifac0 <https://github.com/Bonifac0>
pkgname=tui_calculator
pkgver=0.2.0
pkgrel=1
pkgdesc="Advanced CASIO-inspired scientific TUI calculator with LaTeX and matrix support"
arch=('x86_64' 'aarch64')
url="https://github.com/Bonifac0/TUI_Calculator"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bonifac0/TUI_Calculator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3e2e46ae5887ce832368573c26a63317843c547736a350bfebeb2778792f58e')

build() {
    cd "TUI_Calculator-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "TUI_Calculator-$pkgver"
    cargo test --release --locked
}

package() {
    cd "TUI_Calculator-$pkgver"

    # Binary
    install -Dm755 "target/release/tui_calculator" \
        "$pkgdir/usr/bin/tui_calculator"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Man page
    install -Dm644 "tui_calculator.1" \
        "$pkgdir/usr/share/man/man1/tui_calculator.1"

    # Desktop entry
    install -Dm644 "tui_calculator.desktop" \
        "$pkgdir/usr/share/applications/tui_calculator.desktop"

    # Application icon
    install -Dm644 "tui_calculator.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tui_calculator.svg"
}

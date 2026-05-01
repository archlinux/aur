# Maintainer: deliriouspork
pkgname=depk-sensitivity-matcher
pkgver=2.0.0
pkgrel=2
pkgdesc="Match mouse sensitivity between 3D games on Linux (Rust version). Works on X11 and Wayland."
arch=('x86_64')
url="https://codeberg.org/deliriouspork/DePk-Sensitivity-Matcher-Rust"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1a02f7612b042ee0b4c588c9e8502c10b03f91300ca29805d4e67ebc0732433')

prepare() {
    cd "depk-sensitivity-matcher-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "depk-sensitivity-matcher-rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "depk-sensitivity-matcher-rust"

    install -Dm4755 "target/release/DePk-Sensitivity-Matcher-Rust" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "depk-sensitivity-matcher-rust.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "depk-sensitivity-matcher.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

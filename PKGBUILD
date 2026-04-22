# Maintainer: deliriouspork
pkgname=depk-sensitivity-matcher
pkgver=2.0.0
pkgrel=1
pkgdesc="Match mouse sensitivity between 3D games on Linux (Rust version). Works on X11 and Wayland."
arch=('x86_64')
url="https://github.com/deliriouspork/DePk-Sensitivity-Matcher-Rust"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f91a5418ce28ff85b2962d89a132f7170a47850872e5f1fc25478cae290fa87f')

prepare() {
    cd "DePk-Sensitivity-Matcher-Rust-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "DePk-Sensitivity-Matcher-Rust-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "DePk-Sensitivity-Matcher-Rust-$pkgver"

    install -Dm4755 "target/release/DePk-Sensitivity-Matcher-Rust" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "depk-sensitivity-matcher-rust.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "depk-sensitivity-matcher.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

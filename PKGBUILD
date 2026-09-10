# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber
pkgver=0.9.25
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'libxkbcommon'
    'gcc-libs'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'wl-clipboard'
    'grim'
    'slurp'
)
makedepends=(
    'cargo'
)
optdepends=(
    'wayscriber-configurator: GUI configurator (F11)'
)
conflicts=('wayscriber-debug<0.8.6')
replaces=('wayscriber-debug')
source=("wayscriber-$pkgver.tar.gz::https://github.com/devmobasa/wayscriber/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31c6c4051b6be3a20cef36e0a6137e27f4384e4f57021c03902e13006f889708')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin wayscriber
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/wayscriber" "$pkgdir/usr/bin/wayscriber"

# Wayscriber desktop integration
    install -Dm644 packaging/wayscriber.desktop "$pkgdir/usr/share/applications/wayscriber.desktop"
    install -Dm644 packaging/icons/wayscriber-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-19.png "$pkgdir/usr/share/icons/hicolor/19x19/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-22.png "$pkgdir/usr/share/icons/hicolor/22x22/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-38.png "$pkgdir/usr/share/icons/hicolor/38x38/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-16.png "$pkgdir/usr/share/icons/hicolor/16x16/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-19.png "$pkgdir/usr/share/icons/hicolor/19x19/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-22.png "$pkgdir/usr/share/icons/hicolor/22x22/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-24.png "$pkgdir/usr/share/icons/hicolor/24x24/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-38.png "$pkgdir/usr/share/icons/hicolor/38x38/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-64.png "$pkgdir/usr/share/icons/hicolor/64x64/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-128.png "$pkgdir/usr/share/icons/hicolor/128x128/status/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber-128.png "$pkgdir/usr/share/pixmaps/wayscriber.png"
    install -Dm644 packaging/icons/wayscriber.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wayscriber.svg"
    install -Dm644 packaging/icons/wayscriber-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/wayscriber-symbolic.svg"
# End Wayscriber desktop integration

    install -Dm644 packaging/wayscriber.service "$pkgdir/usr/lib/systemd/user/wayscriber.service"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}

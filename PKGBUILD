# Maintainer: plgeek
pkgname=adguard-home-toggle
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI and system tray tool to control AdGuard Home protection on Linux"
arch=('x86_64')
url="https://github.com/subsy/adguard-home-toggle"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'dbus')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subsy/adguard-home-toggle/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/adguard-toggle" "$pkgdir/usr/bin/adguard-toggle"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

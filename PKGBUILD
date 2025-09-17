# Maintainer: Dividebysandwich <josef.jahn@gmail.com>
pkgname=lightningview
pkgver=2.1.0
pkgrel=1
pkgdesc="A lightning-fast cross-platform image viewer written in Rust, supporting many raw camera formats."
arch=('x86_64')
url="https://github.com/dividebysandwich/LightningView"
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'fontconfig' 'dbus' 'openssl')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/LightningView/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
    "logo_256.png"
)
sha256sums=('3d8653792da483242644132771d5b9403b471cafdf5fe26b605c05fe0ba3fccc'
            '90cc380f68f7b201d5fe1caede685e06ef9e5f01beb1bf719887190c4c8465f4'
            '09492ed9bde5eb1d4857e2551c0fabcaf57bdd873d09c0112b3b27ef01135893')

build() {
    cd "LightningView-$pkgver"
    cargo build --release
}

package() {
    cd "LightningView-$pkgver"

    # Install the main binary
    install -Dm755 "target/release/lightningview" "$pkgdir/usr/bin/lightningview"

    # Install the license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install the .desktop file for application menus
    install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install the application icon
    install -Dm644 "../logo_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

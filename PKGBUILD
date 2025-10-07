# Maintainer: Dividebysandwich <josef.jahn@gmail.com>
pkgname=lightningview
pkgver=2.2.1
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
sha256sums=('1bdb9614e3a08af4514dbe31b3bdd747a357352923334b191f1e5cffd816059f'
            '1ef21573ec2eec0ffac2f4820538554b04b4b441c3266ebe7a8a62052b0ecd80'
            '09492ed9bde5eb1d4857e2551c0fabcaf57bdd873d09c0112b3b27ef01135893')

build() {
    cd "LightningView-$pkgver"
    # --locked ensures we use the versions from Cargo.lock for a reproducible build
    cargo build --release --locked
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

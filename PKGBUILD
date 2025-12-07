# Maintainer: BurgessTG <https://github.com/BurgessTG>
pkgname=waybar-crypto-ticker
pkgver=1.0.0
pkgrel=1
pkgdesc="A sleek, scrolling cryptocurrency ticker overlay for Waybar on Hyprland/Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/BurgessTG/waybar-crypto-ticker"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BurgessTG/waybar-crypto-ticker/archive/v$pkgver.tar.gz")
sha256sums=('d48d56e7cffc085b919cf38691bbf894f9c708f8526c89bd89f6a7bc246a2bc9')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/waybar-crypto-ticker" "$pkgdir/usr/bin/waybar-crypto-ticker"

    # Install icons
    install -dm755 "$pkgdir/usr/share/waybar-crypto-ticker/icons"
    install -Dm644 icons/* "$pkgdir/usr/share/waybar-crypto-ticker/icons/"

    # Install example config
    install -Dm644 config.example.toml "$pkgdir/usr/share/waybar-crypto-ticker/config.example.toml"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

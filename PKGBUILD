# Maintainer: Your Name <your.email@example.com>
pkgname=msigd-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop GUI for controlling MSI gaming monitors"
arch=('x86_64')
url="https://github.com/aydiler/msigd-gui"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'msigd')
makedepends=('rust' 'cargo' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aydiler/msigd-gui/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    npm ci
    npm run tauri build -- --bundles none
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "src-tauri/target/release/msigd-gui" "$pkgdir/usr/bin/msigd-gui"

    # Install desktop file
    install -Dm644 "msigd-gui.desktop" "$pkgdir/usr/share/applications/msigd-gui.desktop"

    # Install icons
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/msigd-gui.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/msigd-gui.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/msigd-gui.png"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}

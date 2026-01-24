# Maintainer: aydiler <aydiler@users.noreply.github.com>
pkgname=msigd-gui-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Desktop GUI for controlling MSI gaming monitors (prebuilt binary)"
arch=('x86_64')
url="https://github.com/aydiler/msigd-gui"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('msigd-git: CLI backend for monitor control')
provides=('msigd-gui')
conflicts=('msigd-gui')
source=("MSI.Monitor.Control_${pkgver}_amd64.AppImage::https://github.com/aydiler/msigd-gui/releases/download/v$pkgver/MSI.Monitor.Control_${pkgver}_amd64.AppImage"
        "msigd-gui.desktop::https://raw.githubusercontent.com/aydiler/msigd-gui/v$pkgver/io.github.aydiler.msigd-gui.desktop"
        "icon-32.png::https://raw.githubusercontent.com/aydiler/msigd-gui/v$pkgver/src-tauri/icons/32x32.png"
        "icon-128.png::https://raw.githubusercontent.com/aydiler/msigd-gui/v$pkgver/src-tauri/icons/128x128.png")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    chmod +x "MSI.Monitor.Control_${pkgver}_amd64.AppImage"
    ./MSI.Monitor.Control_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
    # Install binary from extracted AppImage
    install -Dm755 "squashfs-root/usr/bin/msigd-gui" "$pkgdir/usr/bin/msigd-gui"

    # Install desktop file
    install -Dm644 "msigd-gui.desktop" "$pkgdir/usr/share/applications/msigd-gui.desktop"

    # Install icons
    install -Dm644 "icon-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/msigd-gui.png"
    install -Dm644 "icon-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/msigd-gui.png"
}

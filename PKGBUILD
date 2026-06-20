# Maintainer: Mouhamed Kammoun <mouhamed.kammoun@murena.io>
# Original Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64')
url="https://github.com/Matteo842/SaveState"
license=('GPL-3.0-only')
groups=()
depends=('libgl')
makedepends=()
checkdepends=()
optdepends=()
provides=(savestate)
conflicts=(savestate)
replaces=()
backup=()
options=()
source=("https://github.com/Matteo842/SaveState/releases/download/v${pkgver}/SaveState_v${pkgver}_Linux.tar.xz")
noextract=()
sha256sums=('0956b04058a1f58d368d95daccdf77089b16c8c1f03d16c9f8ac3b671f280b6c')

package() {
    cd "$srcdir/SaveState"
    
    # Extract the AppImage
    ./SaveState.AppImage --appimage-extract
    
    # Install the binary
    install -Dm755 squashfs-root/usr/bin/SaveState "$pkgdir/usr/bin/SaveState"
    
    # Install desktop file
    install -Dm644 squashfs-root/SaveState.desktop "$pkgdir/usr/share/applications/SaveState.desktop"
    
    # Install icon to pixmaps (fallback location)
    install -Dm644 squashfs-root/SaveState.png "$pkgdir/usr/share/pixmaps/SaveState.png"
    
    # Also install icon to hicolor theme for better compatibility
    install -Dm644 squashfs-root/SaveState.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/SaveState.png"
}
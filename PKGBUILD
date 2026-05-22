# Maintainer: irring <твой@email.com>
pkgname=squirrel-disk-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Visual disk space analyzer with sunburst chart"
arch=('x86_64')
url="https://github.com/adileo/squirreldisk"
license=('MIT')
depends=('fuse2')
source_x86_64=("https://github.com/adileo/squirreldisk/releases/download/v${pkgver}/squirrel-disk_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('3145892a8f6e6425c633b0badb7cfae0f738b737102b025e608d04802a9b3442')

prepare() {
    chmod +x "squirrel-disk_${pkgver}_amd64.AppImage"
    "./squirrel-disk_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "squirrel-disk_${pkgver}_amd64.AppImage" \
        "$pkgdir/usr/bin/squirrel-disk"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/squirrel-disk.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/squirrel-disk.png"

    cat > squirrel-disk.desktop << 'DESKTOP'
[Desktop Entry]
Name=Squirrel Disk
Exec=squirrel-disk
Icon=squirrel-disk
Type=Application
Categories=Utility;System;
Comment=Visual disk space analyzer
DESKTOP
    install -Dm644 squirrel-disk.desktop \
        "$pkgdir/usr/share/applications/squirrel-disk.desktop"
}

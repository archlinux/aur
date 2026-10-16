# Maintainer: Mathias Tausen <aur at alias dot tausen dot org>
pkgname=classic-repair-toolbox-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Tool for diagnosing, troubleshooting, and repairing vintage computers and peripherals"
arch=("x86_64")
url="https://github.com/HovKlan-DH/Classic-Repair-Toolbox"
license=('GPL3')
source=("Classic-Repair-Toolbox-v${pkgver}.AppImage::https://github.com/HovKlan-DH/Classic-Repair-Toolbox/releases/download/${pkgver}/Classic-Repair-Toolbox.AppImage")
sha256sums=('93383372e0071c4923d693a958f281318ef68b191bfff438f95f540fb4443ed5')
options=(!strip !debug)

package() {
    cd "$srcdir"
    chmod +x ./Classic-Repair-Toolbox-v${pkgver}.AppImage
    ./Classic-Repair-Toolbox-v${pkgver}.AppImage --appimage-extract

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/classic-repair-toolbox-bin/"
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/icons/"

    cd squashfs-root
    cp -r ./* "$pkgdir/opt/classic-repair-toolbox-bin/"
    ln -s /opt/classic-repair-toolbox-bin/usr/bin/Classic-Repair-Toolbox "$pkgdir/usr/bin/Classic-Repair-Toolbox"
    cp ./Classic-Repair-Toolbox.desktop "$pkgdir/usr/share/applications/Classic-Repair-Toolbox.desktop"
    cp ./Classic-Repair-Toolbox.png "$pkgdir/usr/share/icons/Classic-Repair-Toolbox.png"
}

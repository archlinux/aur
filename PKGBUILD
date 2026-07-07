# Maintainer: Mathias Tausen <aur at alias dot tausen dot org>
pkgname=classic-repair-toolbox-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Tool for diagnosing, troubleshooting, and repairing vintage computers and peripherals"
arch=("x86_64")
url="https://github.com/HovKlan-DH/Classic-Repair-Toolbox"
license=('GPL3')
source=("Classic-Repair-Toolbox.AppImage::https://github.com/HovKlan-DH/Classic-Repair-Toolbox/releases/download/${pkgver}/Classic-Repair-Toolbox.AppImage")
sha256sums=('f3061abf02d7aafd239881870853ae92943ad6bc87ea285f5d0e47cae2d3212f')
options=(!strip !debug)

package() {
    cd "$srcdir"
    chmod +x ./Classic-Repair-Toolbox.AppImage
    ./Classic-Repair-Toolbox.AppImage --appimage-extract

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/classic-repair-toolbox-bin/"
    mkdir -p "$pkgdir/usr/share/applications/"

    cd squashfs-root
    cp -r ./* "$pkgdir/opt/classic-repair-toolbox-bin/"
    ln -s /opt/classic-repair-toolbox-bin/usr/bin/Classic-Repair-Toolbox "$pkgdir/usr/bin/Classic-Repair-Toolbox"
    cp ./Classic-Repair-Toolbox.desktop "$pkgdir/usr/share/applications/Classic-Repair-Toolbox.desktop"
}

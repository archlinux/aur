# Maintainer: Mathias Tausen <aur at alias dot tausen dot org>
pkgname=classic-repair-toolbox-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Tool for diagnosing, troubleshooting, and repairing vintage computers and peripherals"
arch=("x86_64")
url="https://github.com/HovKlan-DH/Classic-Repair-Toolbox"
license=('GPL3')
source=("https://github.com/HovKlan-DH/Classic-Repair-Toolbox/releases/download/${pkgver}/Classic-Repair-Toolbox.AppImage")
sha256sums=('b055df8fd63c36a4fd4ed76c0db83581ee97d14cdd557346b97073f180c66f61')
options=(!strip !debug)

package() {
    cd "$srcdir"
    chmod +x ./Classic-Repair-Toolbox.AppImage
    ./Classic-Repair-Toolbox.AppImage --appimage-extract

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

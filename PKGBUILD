pkgname=smart-updater
pkgver=1.5.0_alpha
pkgrel=1
pkgdesc="A native PyQt6 based system maintenance and update GUI for Arch Linux and CachyOS"
arch=('any')
url="https://github.com/UniqueSpirit/smart-updater"
license=('GPL')
depends=('python' 'python-pyqt6' 'pacman-contrib')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('860c3d1eeac73b0ffb647082ff79c0ee46696062e1bbbb68b21041b2a3b32bea')

package() {
    local _srcdir="$pkgname-${pkgver/_/-}"

    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$_srcdir/"* "$pkgdir/opt/$pkgname/"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/main.py"

    mkdir -p "$pkgdir/usr/bin"
    echo -e '#!/bin/bash\npython /opt/smart-updater/main.py "$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdir/usr/share/applications"
    echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Smart Updater
Comment=System-Updates einfach und smart
Exec=smart-updater
Icon=/opt/smart-updater/extras/pictures/icon-logo.png
Terminal=false
Categories=System;Settings;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}

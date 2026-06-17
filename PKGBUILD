pkgname=smart-updater
pkgver=1.4.1_alpha
pkgrel=2
pkgdesc="A native PyQt6 based system maintenance and update GUI for Arch Linux"
arch=('any')
url="https://github.com/UniqueSpirit/smart-updater"
license=('GPL')
depends=('python' 'python-pyqt6' 'pacman-contrib')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v1.4.1-alpha.tar.gz")
sha256sums=('34c48b81be7d51b812298b86a6dc041355148c66e4c876d9b0e1e0e091f17e3d')

package() {

    mkdir -p "$pkgdir/opt/$pkgname"

    cp -r "$srcdir/$pkgname-1.4.1-alpha/"* "$pkgdir/opt/$pkgname/"

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
Icon=/opt/smart-updater/Icon Logo.png
Terminal=false
Categories=System;Settings;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}

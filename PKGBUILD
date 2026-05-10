pkgname=smart-updater
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight, intelligent, and beautiful GUI update tool for CachyOS"
arch=('any')
url="https://github.com/UniqueSpirit/smart-updater"
license=('GPL')
depends=('python' 'python-pyqt6' 'pacman-contrib')
source=("$url/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
    # 1. Den Hauptordner im System erstellen (/opt/smart-updater)
    mkdir -p "$pkgdir/opt/$pkgname"

    # 2. Alle Dateien aus deinem GitHub-Zip dorthin kopieren
    cp -r "$srcdir/$pkgname-main/"* "$pkgdir/opt/$pkgname/"

    # 3. Einen ausführbaren Befehl für das Terminal erstellen
    mkdir -p "$pkgdir/usr/bin"
    echo -e '#!/bin/bash\npython /opt/smart-updater/main.py "$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # 4. Die Desktop-Verknüpfung für das Startmenü anlegen
    mkdir -p "$pkgdir/usr/share/applications"
    echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Smart Updater
Comment=System-Updates einfach und smart
Exec=smart-updater
Icon=/opt/smart-updater/maskottchen.png
Terminal=false
Categories=System;Settings;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}

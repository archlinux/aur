pkgname=smart-updater
pkgver=1.3.7_alpha
pkgrel=1
pkgdesc="A lightweight, intelligent, and beautiful GUI update tool for CachyOS"
arch=('any')
url="https://github.com/UniqueSpirit/smart-updater"
license=('GPL')
depends=('python' 'python-pyqt6' 'pacman-contrib')
# Zieht jetzt das feste Release, nicht den flexiblen Main-Branch
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v1.3.7-alpha.tar.gz")
sha256sums=('e4637a28c84787a976a6c114f85da3b96ddace2ed7f24448e0377ee6ffecf0c5')

package() {
    # 1. Den Hauptordner im System erstellen (/opt/smart-updater)
    mkdir -p "$pkgdir/opt/$pkgname"

    # 2. Alle Dateien aus deinem GitHub-Zip dorthin kopieren
    # ACHTUNG: Da wir das Release laden, heißt der Ordner jetzt -1.2.1-alpha
    cp -r "$srcdir/$pkgname-1.3.7-alpha/"* "$pkgdir/opt/$pkgname/"

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
Icon=/opt/smart-updater/Icon Logo.png
Terminal=false
Categories=System;Settings;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}

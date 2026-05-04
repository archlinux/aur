# Maintainer: Berke Oruc <berke3oruc@gmail.com>

pkgname="broslauncher"
pkgver="1.0.8"
pkgrel="2"
pkgdesc="Bros Launcher - Virtual Machine for Bros OS Testing"
arch=("x86_64")
url="https://github.com/berkeoruc/bros"
license=("PROPRIETARY")
depends=("python3" "tk")
source=("broslauncher-1.0.8.tar.gz")
sha256sums=("SKIP")

package() {
    cd "$srcdir"
    
    mkdir -p "$pkgdir/usr/share/broslauncher"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    
    cp -r launcher.py "$pkgdir/usr/share/broslauncher/"
    cp -r constants.py "$pkgdir/usr/share/broslauncher/"
    cp -r schematic.py "$pkgdir/usr/share/broslauncher/"
    cp -r bros-logo.png "$pkgdir/usr/share/broslauncher/"
    
    chmod +x "$pkgdir/usr/share/broslauncher/launcher.py"
    
    printf '#!/bin/bash\ncd /usr/share/broslauncher\nif [ ! -f bros.iso ]; then echo "Download Bros OS ISO from: https://github.com/berkeoruc/bros/releases"; echo "Place bros.iso in /usr/share/broslauncher/"; fi\nexec python3 launcher.py "$@"\n' > "$pkgdir/usr/bin/broslauncher"
    chmod +x "$pkgdir/usr/bin/broslauncher"
    
    printf '[Desktop Entry]\nName=Bros Launcher\nComment=Virtual Machine for Bros OS Testing\nExec=broslauncher\nIcon=broslauncher\nTerminal=false\nType=Application\nCategories=System;Utility;\n' > "$pkgdir/usr/share/applications/broslauncher.desktop"
}
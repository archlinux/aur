# Maintainer: Berke Oruc <berke3oruc@gmail.com>

pkgname="broslauncher"
pkgver="1.0.5"
pkgrel="1"
pkgdesc="Bros Launcher - Virtual Machine for Bros OS Testing"
arch=("x86_64")
url="https://github.com/berkeoruc/bros"
license=("PROPRIETARY")
depends=("python3" "tk" "qemu-full")
source=("launcher_wrapper.py"
        "launcher.py"
        "schematic.py"
        "constants.py"
        "bros-logo.png")
noextract=("launcher_wrapper.py" "launcher.py" "schematic.py" "constants.py" "bros-logo.png")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

package() {
    cp launcher_wrapper.py "$pkgdir/usr/bin/broslauncher"
    chmod +x "$pkgdir/usr/bin/broslauncher"
    
    install -d "$pkgdir/usr/share/broslauncher"
    cp launcher.py "$pkgdir/usr/share/broslauncher/launcher.py"
    cp schematic.py "$pkgdir/usr/share/broslauncher/schematic.py"
    cp constants.py "$pkgdir/usr/share/broslauncher/constants.py"
    cp bros-logo.png "$pkgdir/usr/share/broslauncher/bros-logo.png"
    
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    cp bros-logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/broslauncher.png"
    
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/broslauncher.desktop" << 'EOF'
[Desktop Entry]
Name=Bros Launcher
Comment=Virtual Machine for Bros OS Testing
Exec=python3 /usr/bin/broslauncher
Icon=broslauncher
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}
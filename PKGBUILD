# Maintainer: Your Name <your.email@example.com>
pkgname=ios-mount-gui
pkgver=1.0.0
pkgrel=4
pkgdesc="Modern PyQt6 GUI to browse iOS app files on Linux"
arch=('x86_64')
url="https://github.com/kakalpa/Mount-IOS-Linux"
license=('GPL')
depends=('libimobiledevice' 'fuse3')
source=("${url}/releases/download/v${pkgver}/iOS-Mount-GUI-x86_64.AppImage")
sha256sums=('235b3bfdd89ef4abc2d7662139328ecf1c7526db31309497a65a8df8ef549235')

package() {
    install -Dm755 "iOS-Mount-GUI-x86_64.AppImage" "${pkgdir}/opt/ios-mount-gui/iOS-Mount-GUI-x86_64.AppImage"
    
    # Create wrapper script
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/ios-mount-gui" << 'SCRIPT'
#!/bin/bash
exec /opt/ios-mount-gui/iOS-Mount-GUI-x86_64.AppImage "$@"
SCRIPT
    chmod +x "${pkgdir}/usr/bin/ios-mount-gui"
    
    # Create .desktop file
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/ios-mount-gui.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.0
Type=Application
Name=iOS Mount GUI
Comment=Browse iOS app files on Linux
Exec=ios-mount-gui
Icon=ios-mount-gui
Categories=Utility;System;
Terminal=false
StartupNotify=true
DESKTOP
}

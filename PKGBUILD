# Maintainer: Your Name <your.email@example.com>
pkgname=ios-mount-gui
pkgver=1.0.0
pkgrel=2
pkgdesc="Modern PyQt6 GUI to browse iOS app files on Linux"
arch=('x86_64')
url="https://github.com/kakalpa/Mount-IOS-Linux"
license=('GPL')
depends=('libimobiledevice' 'fuse3')
source=("${url}/releases/download/v${pkgver}/iOS-Mount-GUI-x86_64.AppImage"
        "ios-mount-gui.desktop")
sha256sums=('235b3bfdd89ef4abc2d7662139328ecf1c7526db31309497a65a8df8ef549235'
            'SKIP')

package() {
    install -Dm755 "iOS-Mount-GUI-x86_64.AppImage" "${pkgdir}/opt/ios-mount-gui/iOS-Mount-GUI-x86_64.AppImage"
    install -Dm644 "ios-mount-gui.desktop" "${pkgdir}/usr/share/applications/ios-mount-gui.desktop"
    
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/ios-mount-gui" << 'EOF'
#!/bin/bash
exec /opt/ios-mount-gui/iOS-Mount-GUI-x86_64.AppImage "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/ios-mount-gui"
}

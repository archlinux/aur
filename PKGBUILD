# Maintainer: Kotsasmin <kotsasmin@gmail.com>
pkgname=modiva-launcher-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="The official Modiva launcher"
arch=('x86_64')
url="https://modiva-launcher.xyz"
license=('proprietary')
depends=('zlib' 'fuse2' 'hicolor-icon-theme' 'desktop-file-utils')
options=('!strip')
provides=("modiva-launcher")
conflicts=("modiva-launcher")
source=("modiva-launcher-${pkgver}.AppImage::https://github.com/modiva-launchers/modiva-releases/releases/download/v${pkgver}/Modiva.Launcher_${pkgver}_amd64.AppImage"
        "icon.png")
sha256sums=('e78ad1778f89242e42074ab5e42abfd5e2f456354904d920c75965ff90d428cf'
            '295812bdd6e56cdd816a1e4c7db8f3803be5da302569b397d662d4c92c81874b')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    
    install -m755 "modiva-launcher-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/modiva-launcher.AppImage"
    
    # Symlink to /usr/bin
    ln -s "/opt/${pkgname}/modiva-launcher.AppImage" "${pkgdir}/usr/bin/modiva-launcher"

    # Extract desktop file and icon
    # Note: This is a common way to get resources from AppImage, but might fail if --appimage-extract fails. 
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/modiva-launcher.desktop" <<EOF
[Desktop Entry]
Name=Modiva Launcher
Comment=The official launcher for Modiva
Exec=/usr/bin/modiva-launcher
Icon=modiva-launcher
Terminal=false
Type=Application
Categories=Game;
EOF
    # Install local icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/modiva-launcher.png"
}

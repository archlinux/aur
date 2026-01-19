# Maintainer: Kotsasmin <kotsasmin@gmail.com>
pkgname=modiva-launcher-bin
pkgver=0.3.4
pkgrel=2
pkgdesc="The official Modiva launcher"
arch=('x86_64')
url="https://modiva-launcher.xyz"
license=('proprietary')
depends=('zlib' 'fuse2' 'hicolor-icon-theme' 'desktop-file-utils')
options=('!strip')
provides=("modiva-launcher")
conflicts=("modiva-launcher")
source=("modiva-launcher-${pkgver}.AppImage::https://github.com/modiva-launchers/modiva-releases/releases/download/v${pkgver}/Modiva.Launcher_${pkgver}_amd64.AppImage")
sha256sums=('1d5fd5303e3ca923c8803416a4801138053b6dd3c648540c936860b6c7d6eb05')

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

    # chmod +x "${pkgdir}/opt/${pkgname}/modiva-launcher.AppImage"
    # "${pkgdir}/opt/${pkgname}/modiva-launcher.AppImage" --appimage-extract "usr/share/icons/hicolor/512x512/apps/modiva-launcher.png"
    # install -Zm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/modiva-launcher.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/modiva-launcher.png"
}

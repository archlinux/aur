# Maintainer: Trex099 <trex099@github.com>
pkgname=velocity-bridge
pkgver=2.0.9
pkgrel=1
pkgdesc="iOS to Linux Clipboard Sync - Copy on iPhone, paste on Linux"
arch=('x86_64')
url="https://github.com/Trex099/Velocity-Bridge"
license=('GPL-3.0-only')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'wl-clipboard'
    'xclip'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
source=("https://github.com/Trex099/Velocity-Bridge/releases/download/v${pkgver}/Velocity-Bridge_${pkgver}_amd64.AppImage"
        "https://raw.githubusercontent.com/Trex099/Velocity-Bridge/main/assets/velocity-icon.png")
sha256sums=('d270a74f7c5bf4098650e8e23ed9c458c397098c1929ba5990ca454ada8908ab'
            '2d8d8b52919fb5970a1a208d363c5d83310ec521a7adad897984a4741f70e37c')
options=('!strip')

package() {
    # Install binary
    install -Dm755 "${srcdir}/Velocity-Bridge_${pkgver}_amd64.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install icon (already downloaded via source array)
    install -Dm644 "${srcdir}/velocity-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    
    # Create desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Velocity Bridge
Comment=iOS to Linux Clipboard Sync
Exec=${pkgname}
Icon=${pkgname}
Type=Application
Categories=Utility;Network;
Terminal=false
EOF
}

post_install() {
    echo ">>> Velocity Bridge installed!"
    echo ">>> Run 'velocity-bridge' or find it in your applications menu."
}

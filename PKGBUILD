# Maintainer: Trex099 <trex099@github.com>
pkgname=velocity-bridge
pkgver=2.0.0
pkgrel=2
pkgdesc="iOS to Linux Clipboard Sync - Copy on iPhone, paste on Linux"
arch=('x86_64')
url="https://github.com/Trex099/Velocity-Bridge"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'wl-clipboard'
    'xclip'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
source=("${pkgname}-${pkgver}::https://github.com/Trex099/Velocity-Bridge/releases/download/v${pkgver}/velocity-bridge-linux-x86_64")
sha256sums=('SKIP')

package() {
    # Install binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Create directories
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    
    # Create desktop file
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
    
    # Download and install icon
    curl -fsSL "https://raw.githubusercontent.com/Trex099/Velocity-Bridge/main/gui/velocity-icon-final.png" \
        -o "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}

post_install() {
    echo ">>> Velocity Bridge installed!"
    echo ">>> Run 'velocity-bridge' or find it in your applications menu."
}

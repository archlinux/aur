# Maintainer: EbadiDev <kingali0098@gmail.com>
pkgname=archnet-bin
pkgver=0.9.20
pkgrel=1
pkgdesc="A VPN GUI client supporting v2ray, xray, sing-box, clash, and mihomo cores"
arch=('x86_64')
url="https://github.com/ArchNets/ArchNet-app"
license=('custom')
depends=('gtk3' 'libsecret')
optdepends=(
    'libayatana-appindicator: for system tray support'
)
provides=('archnet')
conflicts=('archnet')
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/ArchNets/ArchNet-app/releases/download/v${pkgver}/archnet-linux.zip"
    "archnet.desktop"
    "archnet.sh"
)
sha256sums=('SKIP'  # Will be updated after first release
            'SKIP'
            'SKIP')

package() {
    # Install the application to /opt
    install -dm755 "${pkgdir}/opt/archnet"
    cp -r "${srcdir}/archnet-linux/"* "${pkgdir}/opt/archnet/"
    
    # Install the launcher script
    install -Dm755 "${srcdir}/archnet.sh" "${pkgdir}/usr/bin/archnet"
    
    # Install desktop file
    install -Dm644 "${srcdir}/archnet.desktop" "${pkgdir}/usr/share/applications/archnet.desktop"
    
    # Install icon (extracted from the bundle)
    if [ -f "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon.png" ]; then
        install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon.png" \
            "${pkgdir}/usr/share/pixmaps/archnet.png"
    elif [ -f "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon_rounded_square.png" ]; then
        install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/icon/icon_rounded_square.png" \
            "${pkgdir}/usr/share/pixmaps/archnet.png"
    fi
    
    # Install license (all rights reserved as per README)
    install -Dm644 "${srcdir}/archnet-linux/data/flutter_assets/assets/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
    
    # Set executable permissions
    chmod +x "${pkgdir}/opt/archnet/archnet"
}

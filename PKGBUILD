# Maintainer: Hei-DataHub <noreply@example.com>
# AUR package for Hei-DataHub
# Installs the AppImage system-wide with desktop integration

pkgname=hei-datahub
pkgver=0.62.0
pkgrel=1
pkgdesc="Lightweight local data hub with TUI for managing datasets"
arch=('x86_64')
url="https://github.com/0xpix/Hei-DataHub"
license=('MIT')
depends=('fuse2')
options=('!strip')
source=(
    "HeiDataHub-${pkgver}-x86_64.AppImage::https://github.com/0xpix/Hei-DataHub/releases/download/${pkgver}/HeiDataHub-${pkgver}-x86_64.AppImage"
    "hei-datahub.desktop"
    "hei-datahub.png::https://raw.githubusercontent.com/0xpix/Hei-DataHub/main/assets/png/icon_1024.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    # Create directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Install AppImage
    install -Dm755 "HeiDataHub-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/HeiDataHub.AppImage"

    # Create wrapper script
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
# Wrapper script for Hei-DataHub AppImage
exec /opt/hei-datahub/HeiDataHub.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "hei-datahub.desktop" "${pkgdir}/usr/share/applications/hei-datahub.desktop"

    # Install icon
    install -Dm644 "hei-datahub.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hei-datahub.png"

    # Install license (fetch from upstream)
    curl -sL "https://raw.githubusercontent.com/0xpix/Hei-DataHub/main/LICENSE" \
        > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

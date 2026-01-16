# Maintainer: Hei-DataHub <noreply@example.com>
# AUR package for Hei-DataHub
# Installs the AppImage system-wide with desktop integration

pkgname=hei-datahub
pkgver=0.64.0b
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
    "LICENSE::https://raw.githubusercontent.com/0xpix/Hei-DataHub/main/LICENSE"
)
sha256sums=(
    '16aa2f6f700c65566892cedca36cf014e19321f2fde769cfc05228178031da46'
    '7e8c79f82293f6cc1e99beedd3e7c47a8fa9c9f04c4b1ff8115ed67f0378c2a3'
    '145542aa5db397d58e066ca06d838c55849e668e964617f54604018bc18eccfc'
    'de84048665a009483980ac5190e7d78824cdbc9977fd7faf47196552a58bcb8f'
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
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'WRAPPER'
#!/bin/bash
# Wrapper script for Hei-DataHub AppImage
exec /opt/hei-datahub/HeiDataHub.AppImage "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "hei-datahub.desktop" "${pkgdir}/usr/share/applications/hei-datahub.desktop"

    # Install icon
    install -Dm644 "hei-datahub.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hei-datahub.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

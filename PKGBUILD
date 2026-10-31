# Maintainer: Vanya <your@email.com>

pkgname=vanyavpn-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="VanyaVPN — VPN-клиент"
arch=('x86_64')
url="https://vanyavpn.com"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')
provides=('vanyavpn')
conflicts=('vanyavpn')

source=("VanyaVPN.AppImage::https://storage.googleapis.com/vanyavpn/apps/VanyaVPN.AppImage"
        "vanyavpn.desktop"
        "VanyaVPN.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

noextract=("VanyaVPN.AppImage")

prepare() {
    chmod +x "VanyaVPN.AppImage"
}

package() {
    # AppImage
    install -Dm755 "VanyaVPN.AppImage" \
        "${pkgdir}/opt/vanyavpn/VanyaVPN.AppImage"

    # .desktop
    install -Dm644 "vanyavpn.desktop" \
        "${pkgdir}/usr/share/applications/vanyavpn.desktop"

    # Иконка 128x128
    install -Dm644 "VanyaVPN.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vanyavpn.png"

    # Symlink для терминала
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/vanyavpn/VanyaVPN.AppImage "${pkgdir}/usr/bin/vanyavpn"
}

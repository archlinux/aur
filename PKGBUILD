# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chain-desktop-wallet-appimage"
pkgver=1.4.1
pkgrel=3
pkgdesc="Crypto.com DeFi Desktop Wallet"
arch=('x86_64')
url="https://crypto.com/defi-wallet"
_githuburl="https://github.com/crypto-com/chain-desktop-wallet"
license=(Apache2)
options=(!strip)
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/dev/LICENSE")
sha256sums=('5920c47e39791d645a973b70f17545ffc5f3d20b24dccc5c9907abaa66606f42'
            '5dc668e9da2219be60ae13d4dbdc7e4680d0c2d6438d3606a618a1626ebd31f6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/chain-desktop-wallet.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
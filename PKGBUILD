# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=chain-desktop-wallet
pkgname="${_pkgname}-appimage"
pkgver=1.4.1
pkgrel=2
pkgdesc="Crypto.com DeFi Desktop Wallet"
arch=('x86_64')
url="https://crypto.com/defi-wallet"
_githuburl="https://github.com/crypto-com/chain-desktop-wallet"
license=(Apache2.0)
options=(!strip)
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/dev/LICENSE")
sha256sums=('5920c47e39791d645a973b70f17545ffc5f3d20b24dccc5c9907abaa66606f42'
            '9722bb1e6de44b2b9231fb0f2b1802f633b6ad9651adca37d8adfadb377ad573')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/chain-desktop-wallet.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
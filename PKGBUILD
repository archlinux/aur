# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chain-desktop-wallet-appimage
_pkgname=chain-desktop-wallet
pkgver=1.4.1
pkgrel=1
pkgdesc="Crypto.com DeFi Desktop Wallet"
arch=('x86_64')
url="https://crypto.com/defi-wallet"
_githuburl="https://github.com/crypto-com/chain-desktop-wallet"
license=('APL2')
options=(!strip)
conflicts=()
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage")
sha512sums=('15cfe271660e2be97c7c2360afd34cadc0a13fed4ededb44b97db1070687670588d2498b389da2b8cb53fdae432ea1bded01c62b1d7dc089a35ffb38636cfa7a')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/chain-desktop-wallet.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
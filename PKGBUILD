# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="onekey-wallet-appimage"
pkgver=4.5.0
pkgrel=1
pkgdesc="Secure, open source and community driven crypto wallet runs on all platforms and trusted by millions."
arch=('x86_64')
url="https://onekey.so/"
_githuburl="https://github.com/OneKeyHQ/app-monorepo"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/OneKey-Wallet-${pkgver}-linux-x86_64.AppImage")
sha256sums=('12f6a4e5745d57a7cdff9df22ce6a52eea44eed6226c96f13f7637d0ddda12e1')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/onekey-wallet.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
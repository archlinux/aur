# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=speek-appimage
pkgver=1.7.0
pkgrel=2
pkgdesc="Privacy focused messenger that doesn't trust anyone with your identity, your contact list, or your communications"
arch=('x86_64')
url="https://speek.network/"
_githuburl="https://github.com/Speek-App/Speek"
license=('custom')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('glibc' 'zlib')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-release/Speek.Chat-${pkgver}-linux-${CARCH}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/Speek-App/Speek/v${pkgver}-release/src/LICENSE")
sha256sums=('2176f23042d554c85d13a345ea26079c5859e873f1c4b542ce9b574c84e80ac8'
            'dd74eb4a60e927e8fd207fecd8e5d2d720adbfcafe9d68fa1b942b377b78eb29')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|x11 ${pkgname%-appimage}|x11 ${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
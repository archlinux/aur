# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fairshare-appimage"
pkgver=2.0.0
pkgrel=1
pkgdesc="Simplifying the curation and sharing of biomedical research data and software according to applicable FAIR guidelines"
arch=('x86_64')
url="https://fairdataihub.org/fairshare"
_githuburl="https://github.com/fairdataihub/FAIRshare"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/FAIRshare-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/fairdataihub/FAIRshare/main/LICENSE")
sha256sums=('094900dbaa0fd7d896063d9f7e9032f36a5ac8e6b8ac58bd490edfd91f047f6a'
            'f53ab2779598ebdd8bef9425c402eed3cac0e2a6dc3ec5cbda5a07de0bdcf7dc')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fairshare.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
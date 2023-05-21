# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="poi-appimage"
pkgver=10.9.2
pkgrel=1
pkgdesc="Scalable KanColle browser and tool."
arch=("x86_64")
url="https://poi.moe/"
_githuburl="https://github.com/poooi/poi"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
optdepends=()
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/poooi/poi/master/LICENSE")
sha256sums=('117af5e2e116c78daedfc91053762b73e782e02b18817d324974be77a4c35722'
            '618eb41743df522a98a3b8873899d31d2cc39ae7dae6edcee50207461f0bbfc2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/poi.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
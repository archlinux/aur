# Contributor: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copytranslator-appimage
pkgver=9.1.0
pkgrel=2
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=('x86_64')
url="https://copytranslator.gitee.io/"
_githuburl="https://github.com/CopyTranslator/CopyTranslator"
license=('GPL2')
provides=()
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('146a43d0c215c654a8def1c39351fc5d9878fcb2663386e331c96912474f94f3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/copytranslator.AppImage|g;s|/opt/copytranslator/resources/linux-icon/icon.png|copytranslator|g' \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
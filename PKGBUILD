# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="anklang-appimage"
pkgver=0.1.0
pkgrel=1
pkgdesc="MIDI and Audio Synthesizer and Composer"
arch=('x86_64')
url="https://github.com/tim-janik/anklang"
license=("MPL2")
depends=('glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-x64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/tim-janik/anklang/trunk/LICENSE")
sha256sums=('c18263d1b965404ef19692c13cdc8a5ee8f41069b5188fa8cd8b1a94a6462182'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|/usr/local/lib/anklang-0-1/bin/anklang|/opt/appimages/anklang.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
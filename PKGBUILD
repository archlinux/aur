# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="notepad---appimage"
pkgver=2.3
pkgrel=1
pkgdesc="An excellent text editor with the goal of replacing notepad++,from China.一个优秀的文本编辑器,目标是要替换notepad++."
arch=("x86_64")
url="https://github.com/cxasm/notepad--"
license=('GPL3')
depends=('zlib' 'glibc')
makedepends=('gendesk')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgname%---appimage}-v${pkgver}/subtwo-v${pkgver}-redhat7.4-x86_64.AppImage"
    "${pkgname%-appimage}.png::${url}/raw/main/src/Resources/${pkgname%---appimage}_main.png")
sha256sums=('ebc50e4ad748f5f18671cb324dceac55f669668de3f98ef2db80f6d12fd15cf5'
            'facf091173791725861845a4f18fe3640b6f8613a295ba6f6263f66a188d0cc6')
         
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    gendesk -f --icon "${pkgname%-appimage}" --categories "Utility" --name "NotePad--" --exec "/opt/appimages/notepad--.AppImage"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatall-appimage"
pkgver=1.29.42
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
options=('!strip')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-x86_64.AppImage")
sha256sums_aarch64=('b628b1c992016fa00e5950f1c4095e2e169ef08c715bddb4ac984c53497bbe9a')
sha256sums_armv7h=('b628b1c992016fa00e5950f1c4095e2e169ef08c715bddb4ac984c53497bbe9a')
sha256sums_x86_64=('26485a21c5742e1487a501a136ffcb83d7349f5fdb35b4c144c05a19b979a8e1')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
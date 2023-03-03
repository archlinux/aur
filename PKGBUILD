# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=esearch-appimage
_pkgname=eSearch
pkgver=1.9.8
pkgrel=2
epoch=
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib')
optdepends=()
options=(!strip)
provides=()
conflicts=(esearch-bin)
install=
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
_install_path="/opt/appimages"
sha256sums=('cb48cdef279e2813df6228a66f0d19992b148c021903cc8d92c581bf7d2c33d0')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/esearch.desktop"
    echo "Exec=/opt/appimages/eSearch.AppImage" >> "${srcdir}/squashfs-root/esearch.desktop"
    echo "Icon=esearch-appimage" >> "${srcdir}/squashfs-root/esearch.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/resources/app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/squashfs-root/esearch.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

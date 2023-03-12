# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=openai-translator-appimage
_pkgname=open-ai-translator
pkgver=0.0.17
pkgrel=1
pkgdesc="基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用 - Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/yetone/openai-translator"
license=('AGPL3')
options=(!strip)
conflicts=(openai-translator-bin)
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.AppImage")
sha512sums=('a9bbf52f9e934611997726cee5399e8a5f152ffa5ed5da544e08d581b353c6508f15e8b6106158de6e6a816b82e03416f75ed0a3cd23d311b606ef5fe9554045')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
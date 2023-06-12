# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ytdownloader-appimage"
pkgver=3.14.1
pkgrel=1
pkgdesc="A modern GUI App for downloading Videos and Audios from hundreds of sites"
arch=("x86_64")
url="https://ytdn.netlify.app/"
_githuburl="https://github.com/aandrew-me/ytDownloader"
license=("GPL3")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-gui")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/YTDownloader_Linux.AppImage")
sha256sums=('1e9309d71d0db3f1885129a1c57dee797f527b7a611acfbf09f9ef33b4d027fb')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 64x64 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
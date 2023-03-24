# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=Zettlr
pkgname=zettlr-appimage
pkgver=3.0.0
_pkgver=beta.2
pkgrel=1
pkgdesc="A Markdown Editor for the 21st century."
arch=('x86_64')
url="https://www.zettlr.com"
_githuburl="https://github.com/Zettlr/Zettlr"
license=(GPL3)
options=(!strip)
conflicts=(zettlr)
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-${_pkgver}/Zettlr-${pkgver}-${_pkgver}-x86_64.AppImage")
sha256sums=('d395f39d9602e6faf40cfc3cfe03630bc8c86925fc05a7710e586697b5ea4608')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/Zettlr.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${_pkgname}.xml" "${pkgdir}/usr/share/mime/${_pkgname}.xml"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
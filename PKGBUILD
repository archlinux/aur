# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=esearch
pkgname="${_pkgname}-appimage"
pkgver=1.10.0
pkgrel=1
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=(hicolor-icon-theme zlib glibc)
optdepends=()
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}-beta.5/eSearch-${pkgver}-beta.5-linux-x86_64.AppImage")
sha256sums=('7da637aaa206b7c7dc741475ebe3ce023d812b7a4728d1f547e0bc86ce38a17b')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/esearch.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

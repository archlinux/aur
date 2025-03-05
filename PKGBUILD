# Maintainer: puzzle9 <happypuzzle@126.com>

_pkgname=wechat-devtools

pkgname="${_pkgname}"-appimage
pkgver=1.06.2412050
pkgrel=2
pkgdesc="The development tools for wechat projects"
arch=(x86_64)
url="https://github.com/msojocs/wechat-web-devtools-linux"
license=("MIT")
provides=(
    "wechat-devtools-bin"
    "wechat-devtools"
)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=(
    "${_appimage}::https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${pkgver}-${pkgrel}/WeChat_Dev_Tools_v${pkgver}-${pkgrel}_x86_64_linux.AppImage"
    'wechat-devtools.desktop'
)
noextract=("${_appimage}")
sha256sums_x86_64=(
    'skip'
    '9c1b202e6bae3e0f9ee49abc304fa7ec245e9531822bf1f095f8a5579000d645'
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm644 "${srcdir}/wechat-devtools.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "${srcdir}/squashfs-root/wechat-devtools.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/wechat-devtools.png"

    install -dm755 "${pkgdir}/opt/${pkgname}"

    cd "${srcdir}/squashfs-root/"
    cp -r * "${pkgdir}/opt/${pkgname}/" 
}

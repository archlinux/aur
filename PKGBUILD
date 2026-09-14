# Maintainer: puzzle9 <happypuzzle@126.com>

_pkgname=wechat-devtools
pkgname="${_pkgname}"-appimage
pkgver=2.02.2608060
pkgrel=4
pkgdesc="The development tools for wechat projects"
arch=(x86_64)
url="https://github.com/msojocs/wechat-web-devtools-linux"
license=("MIT")
provides=(
    "wechat-devtools-bin"
    "wechat-devtools"
)
options=(!strip)
install="${pkgname}.install"
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=(
    "${_appimage}::https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${pkgver}-1/WeChat_Dev_Tools_v${pkgver}-1_x86_64_linux.AppImage"
    'wechat-devtools.desktop'
)
noextract=("${_appimage}")
sha256sums_x86_64=(
    'a8c91acfd49550612e53404d057499469879a134d58d3d812f7c928bf619cfe2'
    'c426e4d49ad839e8c726ff0b4cdae2fc5ece9a6b572cb7e9260a654ec28b8989'
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract wechat-devtools.png
}

package() {
    install -Dm644 "${srcdir}/wechat-devtools.desktop" \
        "${pkgdir}/opt/${pkgname}/wechat-devtools.desktop"
    install -Dm644 "${srcdir}/squashfs-root/wechat-devtools.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/wechat-devtools.png"
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/wechat-devtools.AppImage"
}

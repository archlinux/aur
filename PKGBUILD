# Maintainer: Maverick <owsmyf@gmail.com>

_pkgname=wechat-devtools
pkgname="${_pkgname}"-appimage
pkgver=2.02.2609250
pkgrel=1
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
    "${_appimage}::https://github.com/msojocs/wechat-web-devtools-linux/releases/download/v${pkgver}-1/WeChat_Dev_Tools_v${pkgver}-1_x86_64_linux.AppImage"
    'wechat-devtools.desktop'
)
noextract=("${_appimage}")
sha256sums_x86_64=(
    'ce78d9e81cfbbfec1b2fd6b859f921d2602ef0cc3afac57136bd56ed3d457e11'
    '1b8e7f7315a7c845d1a3bd7d998bc32b7dd33e2a8921d67d9052db7f982e2ebe'
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

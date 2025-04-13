# Maintainer: taotieren <admin@taotieren.com>

pkgbase=jidugs-appimage
pkgname=jidugs
pkgver=1.4.5
pkgrel=1
pkgdesc="极度公式 公式一键识别快速转换，几十项技术创新助力，快捷方便！"
arch=('x86_64')
url="https://jidugs.wlhex.com/"
license=('LicenseRef-Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
    zlib
)
makedepends=()
backup=()
options=(!strip !debug)
install=
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://jidugs.wlhex.com/download/极度公式-${pkgver}.AppImage")
sha256sums_x86_64=('b829ace8b3d825bf70c24aca408280561df15f652e7ec15b2676258f211d9d55')

_install_path="/opt/appimages"

prepare() {

    chmod a+x ${pkgname}-${pkgver}-${CARCH}.AppImage
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract >/dev/null
    sed 's|AppRun|/opt/appimages/jidugs.AppImage|g' -i "${srcdir}/squashfs-root/jidugspc.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"

    local _icon
    for _icon in 16 32 64 128 256 512 1024; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/jidugspc.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/jidugspc.desktop" -t "${pkgdir}/usr/share/applications"
    #     install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

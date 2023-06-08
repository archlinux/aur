# Maintainer: taotieren <admin@taotieren.com>

pkgbase=jidugs-appimage
pkgname=jidugs
pkgver=1.3.8
pkgrel=0
pkgdesc="极度公式 公式一键识别快速转换，几十项技术创新助力，快捷方便！"
arch=('x86_64')
url="https://jidugs.wlhex.com/"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(hicolor-icon-theme)
makedepends=()
backup=()
options=()
install=
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://download.wrste.com/jidugs/极度公式-${pkgver}.AppImage")
sha256sums_x86_64=('fb6f0d2a9e668a9ec6da26528c2b04118f40a65cedc45cecb47b7619fb06a7bd')

_install_path="/opt/appimages"

prepare() {

    chmod a+x ${pkgname}-${pkgver}-${CARCH}.AppImage
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/jidugs.AppImage|g' -i "${srcdir}/squashfs-root/jidugspc.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"

    local _icon
    for _icon in 16 32 64 128 256 512 1024; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/jidugspc.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/jidugspc.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

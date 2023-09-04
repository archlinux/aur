# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xbydriver-appimage
pkgname=xbydriver-appimage
pkgver=3.11.23
pkgrel=0
pkgdesc="阿里云盘小白羊版 v3 修复版"
arch=('x86_64' 'aarch64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(aliyunpan-liupan1890
    aliyunpan-odomu)
depends=()
makedepends=()
backup=()
options=(!strip)
install=
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-arm64.AppImage")
sha256sums_x86_64=('8b0fda0e42517cdbd4a86a9e38a2f3acf208164703d8b12863664f0705658dae')
sha256sums_aarch64=('acc5738320a2fb24d64f0ca8f7ea53807a16613909667a5f88ac9aab13bd9df0')

_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgname}-${pkgver}-${CARCH}.AppImage
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/xbydriver-appimage.AppImage|g' -i "${srcdir}/squashfs-root/xbyyunpan.desktop"
}

package() {
    install -Dm755 "${srcdir}"/${pkgname}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/xbyyunpan.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/xbyyunpan.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/squashfs-root/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

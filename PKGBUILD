# Maintainer: taotieren <admin@taotieren.com>

pkgbase=aliyunpan-odomu-appimage
pkgname=aliyunpan-odomu
pkgver=3.23.81223
pkgrel=0
pkgdesc="阿里云盘小白羊版 v3 修复版"
arch=('x86_64' 'aarch64')
url="https://github.com/odomu/aliyunpan"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(aliyunpan-liupan1890)
depends=()
makedepends=()
backup=()
options=(!strip)
install=
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-arm64.AppImage")
sha256sums_x86_64=('b12af8568228b22c4cc4846996cc57a9e305154fcf3b3b5d971224a25aebc042')
sha256sums_aarch64=('0c9a0eb455f1ffec13b1298ac3a0073d97c5ed2acb19f3d7f22f3a61aca3dd51')

_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgname}-${pkgver}-${CARCH}.AppImage
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/aliyunpan-odomu.AppImage|g' -i "${srcdir}/squashfs-root/alixby.desktop"
}

package() {
    install -Dm755 "${srcdir}"/${pkgname}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/alixby.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/alixby.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

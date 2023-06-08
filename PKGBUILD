# Maintainer: taotieren <admin@taotieren.com>

pkgbase=aliyunpan-odomu-appimage
pkgname=aliyunpan-odomu
pkgver=3.23.60617
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
options=()
install=
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-arm64.AppImage")
sha256sums_x86_64=('b7f2da02ee43d70ed1de2dc6399e9c3f71de9fbb800287f6f89660f67af3cb90')
sha256sums_aarch64=('22ab2e5e359875151ee17f7582ffbe6ae341d26374e48a17b7524ffd70e26028')

_install_path="/opt/appimages"

prepare() {
    chmod a+x ${pkgname}-${pkgver}-${CARCH}.AppImage
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/aliyunpan-odomu.AppImage|g' -i "${srcdir}/squashfs-root/alixby.desktop"
}

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/alixby.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/alixby.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

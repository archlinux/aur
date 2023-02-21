# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gridea-appimage
_pkgname=gridea
pkgver=0.9.3
pkgrel=1
epoch=
pkgdesc="A static blog writing client (一个静态博客写作客户端)"
arch=("x86_64")
url="open.gridea.dev"
_githuburl="https://github.com/getgridea/gridea"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(gridea)
conflicts=(gridea gridea-bin)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Gridea-${pkgver}.AppImage")
sha256sums=('9538866b640e44e9fd54bc1b3a957d1625648f1c1dd6b942dcd73d22701ede4e')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/gridea.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}

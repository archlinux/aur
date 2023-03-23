# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=gridea
pkgname="${_pkgname}-appimage"
pkgver=0.9.3
pkgrel=2
pkgdesc="A static blog writing client (一个静态博客写作客户端)"
arch=("x86_64")
url="open.gridea.dev"
_githuburl="https://github.com/getgridea/gridea"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Gridea-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9538866b640e44e9fd54bc1b3a957d1625648f1c1dd6b942dcd73d22701ede4e'
            '184d1e6e86b1314f05d7d05c72424818363b477978a3e8b6a84bcba128e64c24')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/gridea.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
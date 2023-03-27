# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=js.design
pkgname=js-design-appimage
pkgver=1.0.5
pkgrel=2
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=("x86_64")
url="https://js.design"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://img.js.design/assets/download/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1%20Linux%E7%89%88.AppImage"
    "LICENSE::${url}/terms")
sha256sums=('93b6795fc40a82d2fe6a2231626bda36d8cc4c56ac0c7234e090984e01d58120'
            '98442aa8cf4da4f76c96be562c6f0b2c9a8369f44517b7fd801a1020a299a9fa')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/js.design.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
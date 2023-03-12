# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=js-design-appimage
_pkgname=js.design
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=("x86_64")
url="https://js.design/"
license=('GPL3')
depends=(hicolor-icon-theme zlib)
options=(!strip)
conflicts=(js-design-bin)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://img.js.design/assets/download/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1%20Linux%E7%89%88.AppImage")
sha256sums=('93b6795fc40a82d2fe6a2231626bda36d8cc4c56ac0c7234e090984e01d58120')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/js.design.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}

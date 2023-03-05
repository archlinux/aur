# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=feidao-appimage
_pkgname=feidao
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="飞稻在线课程设计平台"
arch=("x86_64")
url="https://www.fei-dao.com"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
provides=()
conflicts=()
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://oss.fei-dao.com/resources/application/linux/${_pkgname}_latest.AppImage")
sha256sums=('2a5f5919ebc8c7ef8ebd232758852c87dd0b165208dc46a501ce3cefdd23ded7')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/feidao.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 128x128 256x256 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
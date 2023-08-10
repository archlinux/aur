# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avogadro2-appimage
pkgver=1.97.0
pkgrel=2
pkgdesc="An advanced molecular editor designed for cross-platform use in computational chemistry, molecular modeling, bioinformatics, materials science, and related areas."
arch=("x86_64")
url="https://two.avogadro.cc/"
_githuburl="https://github.com/OpenChemistry/avogadroapp"
license=('BSD3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Avogadro2-${CARCH}.AppImage")
sha256sums=('cc522dbdaa6e5386cb7101d382c5730f0d1ff71f2e70eb10f7e55f4ca052c89d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${pkgname%-appimage}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}
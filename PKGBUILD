# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avogadro2-appimage
_pkgname=Avogadro2
pkgver=1.98.1
pkgrel=2
pkgdesc="An advanced molecular editor designed for cross-platform use in computational chemistry, molecular modeling, bioinformatics, materials science, and related areas."
arch=("x86_64")
url="https://two.avogadro.cc/"
_ghurl="https://github.com/OpenChemistry/avogadroapp"
license=('custom:BSD3-Clause')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OpenChemistry/avogadroapp/${pkgver}/LICENSE"
)
sha256sums=('d9bd66e71cb45e7296c1623db29af9329a89bb8ea58e7602b13af69f22f58166'
            '3e6a55dc0da9bb56a7f232b1766da524c9d9c1dad61dfeea8424f1df7fb6f2f4')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${pkgname%-appimage}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
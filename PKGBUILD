# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=knot
pkgname="android-${_pkgname}-appimage"
pkgver=1.1.05
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("android-${_pkgname}")
providers=("ic005k")
_install_path="/opt/appimages"
source=("${pkgname-$appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Knot-Linux-${CARCH}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/Knot/main/LICENSE")
sha256sums=('949f9ab9a84e709300e60c505b1a55bdf6332c2f0592255e2aebd8ceb766ff91'
            'e81172c8f0c194e8fb34edd30b153e60407a094bbf2492abe4e012e6a1ad854a')
prepare() {
    chmod a+x "${srcdir}/${pkgname-$appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname-$appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=Knot|Exec=${_install_path}/${pkgname-$appimage}.AppImage|g;s|Icon=icon|Icon=${pkgname-$appimage}|g;s|Categories=Application|Categories=Utility|g;s|Name=Knot|Name=Android-Knot|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname-$appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname-$appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname-$appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname-$appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
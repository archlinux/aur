# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=knot
pkgname="android-${_pkgname}-appimage"
pkgver=1.1.04
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
conflit=("android-${_pkgname}")
providers=("ic005k")
_install_path="/opt/appimages"
source=("android-${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Knot-Linux-x86_64.AppImage"
        "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('888c61b8dbd97c4d89c99ff2b98c716afb7e9b2b2c8c332846a4ae84ec5d0136'
            '83261660ff4344578e8fb20ca86a8a45f511619583ed00cc2285e747ac201477')
prepare() {
    chmod a+x "android-${_pkgname}-${pkgver}.AppImage"
    "./android-${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=Knot/Exec=\/opt\/appimages\/android-knot.AppImage/g;s/Icon=icon/Icon=android-knot/g;s/Categories=Application/Categories=Utility/g;s/Name=Knot/Name=Android-Knot/g' \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/android-${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/android-${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/android-${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/android-${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
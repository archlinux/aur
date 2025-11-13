# Maintainer: anlorsp <anlor[at]anlor[dot]top>

pkgname=digikam-appimage
pkgver=8.8.0
pkgrel=2
pkgdesc="The latest stable AppImage of digiKam - an advanced open-source digital photo management application that runs on Linux, Windows, and MacOS."
arch=('x86_64')
license=('GPL-2.0-or-later')
conflicts=('digikam')
depends=('fuse2')
options=(!strip)
source=(
    https://download.kde.org/stable/digikam/${pkgver}/digiKam-${pkgver}-Qt6-x86-64.appimage
    digikam
    showfoto
)
sha256sums=(
    8c306ebbadd457f2e0e84474bc3831c80c6c40a9ad9709710f546027efa35a59
    SKIP
    SKIP
)
url="https://www.digikam.org/"
_source_name="digiKam-${pkgver}-Qt6-x86-64.appimage"
_appimage_name="digiKam.appimage"
_install_path="/opt/appimages/"

package() {
    mv "${srcdir}/${_source_name}" "${srcdir}/${_appimage_name}"
    chmod +x "${srcdir}/${_appimage_name}"
    ${srcdir}/${_appimage_name} --appimage-extract "usr/share/icons/hicolor" >/dev/null 2>&1
    ${srcdir}/${_appimage_name} --appimage-extract "usr/share/applications" >/dev/null 2>&1

    install -dm755 "${pkgdir}/usr/share"

    # install icons
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"

    # install .desktop file and executable file
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/applications" "${pkgdir}/usr/share"
    install -Dm755 "${srcdir}/${_appimage_name}" -t "${pkgdir}${_install_path}"
    install -Dm755 "${srcdir}/digikam" -t "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/showfoto" -t "${pkgdir}/usr/bin/"
}
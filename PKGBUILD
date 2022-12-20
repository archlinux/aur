# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=kuro-appimage
pkgver=8.1.6
pkgrel=2
pkgdesc="An elegant Microsoft ToDo desktop client for Linux (a fork of Ao)"
arch=("x86_64")
url="https://github.com/davidsmorais/kuro"
license=("MIT")
_pkgname="Kuro-${pkgver}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("kuro")
optdepends=()
source=("https://github.com/davidsmorais/kuro/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("df72a833bcc9d21625fcd8ff60f19c80179344c6a26bb0dd332a68c8e003f5ef7db8c67748edb7e4e09dbe5aaf8d78983111e18f72e25eda4024b2baf455f228")

_installdir=/opt/kuro

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract >/dev/null
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/Kuro.AppImage+" "squashfs-root/kuro.desktop"
    sed -i "s+Icon=kuro+Icon=kuro-appimage+" "squashfs-root/kuro.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/Kuro.AppImage"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/kuro.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/kuro-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/kuro.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/kuro-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/kuro.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kuro-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/kuro.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/kuro-appimage.png"
    install -Dm644 "squashfs-root/kuro.desktop" "${pkgdir}/usr/share/applications/kuro-appimage.desktop"
}

# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=kuro-appimage
pkgver=9.0.0
pkgrel=1
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
sha512sums=("52510a1ecae4f655ffc83901048b2dc410394692c17eefdfb86ae66c43fc411fa903f0aa4202cd75f43aa8c1da3e911e81c93173d61c8999bc805d23c0cd2de5")

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

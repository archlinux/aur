# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=kuro-appimage
pkgver=8.1.8
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
sha512sums=("4d89dcfdce12c66091269fe9e1b4676192b41b900d13c72589bfd1ef5f84e75b105f0af06483e67993c77208a04a1c9900c7acc9347d466c35628bb92ace2449")

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

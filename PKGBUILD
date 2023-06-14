# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=pot-translation-appimage
pkgver=1.4.2
pkgrel=1
pkgdesc="A cross-platform software for text translation."
arch=("x86_64")
url="https://pot.pylogmon.com"
license=("GPL3")
_pkgname="pot_${pkgver}_amd64.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=('fuse2')
source=("${_pkgname}::https://github.com/pot-app/pot-desktop/releases/download/${pkgver}/${_pkgname}")
sha512sums=("c1b88510a1573cdff9f8bb7b5715c9f68819aeadca67e5612ece03992e99f6c22f53c9a61bbafd60402b90238b1d28b195bc146c3249a4cc75c6e7df3c137b18")

_installdir=/opt/appimages

prepare() {
    chmod a+x ../${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Exec=.*+Exec=env DESKTOPINTEGRATION=no ${_installdir}/pot-translation.AppImage+" "squashfs-root/usr/share/applications/pot.desktop"
    sed -i "s+^Icon=.*+Icon=pot-translation-appimage+" "squashfs-root/usr/share/applications/pot.desktop"
}

package() {
    install -Dm755 ../${_pkgname} "${pkgdir}/${_installdir}/pot-translation.AppImage"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/pot.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pot-translation-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/pot.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pot-translation-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256@2/apps/pot.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pot-translation-appimage.png"

    install -Dm644 "squashfs-root/usr/share/applications/pot.desktop" "${pkgdir}/usr/share/applications/pot-translation-appimage.desktop"
}

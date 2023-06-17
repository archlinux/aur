# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=pot-translation-appimage
pkgver=1.6.0
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
sha512sums=("078a32bf38780f2405848655809bbb88cabab7a4483db433627674e45f8ff0c05788a4a82703bffe207f459764bd810eb0fa850acd8df1b3b868678dddd9d1bd")

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

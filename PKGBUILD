# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=listen1-desktop-appimage
pkgver=2.31.0
pkgrel=2
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1"
license=("MIT")
_pkgname="listen1_${pkgver}_linux_${arch}.AppImage"
noextract=(${_pkgname})
options=("!strip" "!debug")
depends=('fuse2')
conflicts=("listen1-desktop")
source=("${_pkgname}::https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/${_pkgname}"
    "LICENSE.md::https://raw.githubusercontent.com/listen1/listen1_desktop/master/LICENSE.md")
sha512sums=("7ca7e4c2cdcb3199461fa8707fe480d368ed063df96ecdfe184fd6d6760d0f5af23169d0fbd4318ac7542820622383c7e844bf8c62ea4cc13e59d123d2a1a92a"
    "21c9d751b2f2691ed5dd5a7468d066e6f933c11ea1855625aeb4bc06c5b06145faf19194188affcdf30fbc2033d1597a781676e291ba7f4265931847d28a2144")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Categories.*+Categories=Audio;AudioVideo+" "squashfs-root/listen1.desktop"
    sed -i "s+^Icon=.*+Icon=listen1-appimage+" "squashfs-root/listen1.desktop"
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/listen1.AppImage+" "squashfs-root/listen1.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/listen1.desktop"
}

package() {
    install -Dm755 ../${_pkgname} "${pkgdir}/${_installdir}/listen1.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1-appimage.desktop"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/listen1-desktop/LICENSE"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/16x16/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/48x48/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/64x64/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/listen1-appimage.png"

}

# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=listen1-desktop-appimage
pkgver=2.29.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1"
license=("MIT")
_pkgname="listen1_${pkgver}_linux_${arch}.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=('fuse2')
source=("${_pkgname}::https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("380ba816b258b5f9da1f107d9e41179a2f1d1f386a2c42fd1c09636bc42593cc1457b732eb5929893087b8c3fe337c2a5d3958c6dabc9481699d65acab30489f")

_installdir=/opt/appimages

prepare() {
    chmod a+x ../${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Categories.*+Categories=Audio;AudioVideo+" "squashfs-root/listen1.desktop"
    sed -i "s+^Icon=.*+Icon=listen1-appimage+" "squashfs-root/listen1.desktop"
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/listen1.AppImage+" "squashfs-root/listen1.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/listen1.desktop"
}

package() {
    install -Dm755 ../${_pkgname} "${pkgdir}/${_installdir}/listen1.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1-appimage.desktop"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/16x16/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/48x48/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/64x64/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/listen1-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/listen1.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/listen1-appimage.png"

}

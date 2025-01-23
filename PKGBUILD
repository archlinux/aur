# Maintainer: ikyope at outlook dot com

pkgname=listen1-desktop-appimage
pkgver=2.32.0
pkgrel=1
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
b2sums=("5447dc289aee4c76de88cf0ff8a76788dfec7cc4edc585c4d8847cb0d28ddd5d5433ce3f45b61e2594f930c3b170cf5a80507966425ccab3f9dad9f2ca3f90f0"
    "59d9fb2489a013121cc11df5ae126de8c46d060cf19e6456d9c0d490f2dae36f59cebce8180d890c5212700a73fdbc7eb0c65f920868c0f11fdd58aeab11cae4")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Categories.*+Categories=Audio;AudioVideo+" "squashfs-root/listen1.desktop"
    sed -i "s+^Icon=.*+Icon=listen1-appimage+" "squashfs-root/listen1.desktop"
    sed -i "s+AppRun+${_installdir}/listen1.AppImage+" "squashfs-root/listen1.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/listen1.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/listen1.AppImage"
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

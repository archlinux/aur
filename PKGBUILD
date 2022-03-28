# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=1.9.5
pkgrel=1
pkgdesc="The next generation PKM system, your digital garden"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("unknown")
_pkgname="siyuan-${pkgver}-linux.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("siyuan")
source=("https://download.fastgit.org/siyuan-note/siyuan/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("ec5578d86c7d3ef0c047a415aa1a95176f24f430f37736bdf316f66a2de7d29ad115934c89f52c6642550a339866625bdc0d238fabf133a1a510a2469232c034")

_installdir=/opt/appimages

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract >/dev/null
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+Icon=siyuan+Icon=siyuan-appimage+" "squashfs-root/siyuan.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan-appimage.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/siyuan-appimage.desktop"
}

# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=1.7.2
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
sha512sums=("425aa05fe3061f10387ff8626daa4f13a3c90d8a54b0b2a26f0b367e827a3e5a235bb4c67a3979b90ef38cf5fab29d3abc4959cbae91b1795b96d588ea7331d0")

_installdir=/opt/appimages

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+Icon=siyuan+Icon=siyuan-appimage+" "squashfs-root/siyuan.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan-appimage.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/siyuan-appimage.desktop"
}

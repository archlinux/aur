# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=3.0.5
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL-3.0-only")
_pkgname="siyuan-${pkgver}-linux.AppImage"
noextract=(${_pkgname})
options=("!strip" "!debug")
depends=("fuse2")
optdepends=('pandoc: docx export')
source=("${_pkgname}::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/${_pkgname}")
sha256sums=("ffbf5856508acc279c0467e000d161f5bc08e1b9c1da52d737177c30c95beea0")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+^Icon=.*+Icon=siyuan-appimage+" "squashfs-root/siyuan.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan-appimage.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/siyuan-appimage.desktop"
}

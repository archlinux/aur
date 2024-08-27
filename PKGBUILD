# maintainer: zxkmm (IHp4a21tQGhvdG1haWwuY29t)
# auto running on siyuan official repo
# PKGBUILD is modified from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=siyuan-appimage
# which is made by vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan_stable
pkgver=v3.1.4
pkgrel=0
pkgdesc="auto upload to AUR when SiYuan stable release"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL-3.0-only")
_pkgname=siyuan-3.1.4-linux.AppImage
noextract=(siyuan-3.1.4-linux.AppImage)
options=("!strip" "!debug")
depends=("fuse2")
optdepends=('pandoc: docx export')
source=("${_pkgname}::https://github.com/siyuan-note/siyuan/releases/download/v3.1.4/siyuan-3.1.4-linux.AppImage")
sha256sums=('SKIP')

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+AppRun+${_installdir}/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+^Icon=.*+Icon=siyuan_stable+" "squashfs-root/siyuan.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan_stable.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/siyuan_stable.desktop"
}

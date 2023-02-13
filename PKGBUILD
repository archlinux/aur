# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=2.7.3
pkgrel=1
pkgdesc="A local-first personal knowledge management system, support fine-grained block-level reference and Markdown WYSIWYG"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL3")
_pkgname="siyuan-${pkgver}-linux.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("siyuan")
depends=('fuse2')
optdepends=('pandoc: docx export')
source=("https://release.b3log.org/siyuan/${_pkgname}")
sha512sums=("292ef6c7c17583a5048b6af07a2f12f38121aa8d7513ba94f9fbd33b7978181ede85a1a1dc3c26d944e09d5b2bd2c325f5e854f280c0c30e668b6dc94e5076e1")

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

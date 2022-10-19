# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=2.4.2
pkgrel=1
pkgdesc="A local-first personal knowledge management system, support fine-grained block-level reference and Markdown WYSIWYG"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL3")
_pkgname="siyuan-${pkgver}-linux.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("siyuan")
optdepends=('pandoc: docx export')
source=("https://release.b3log.org/siyuan/${_pkgname}")
sha512sums=("ea39b72e38f07a50aae1037c4bd97be0cc09d0391afe9b1c9cf53df73f52934d4a6d5486364cedb974f0c62eca2ea7d1b6c8ab10b637b5f29836c80cdcb550ef")

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

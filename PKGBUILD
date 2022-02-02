# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan-appimage
pkgver=1.7.11
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
sha512sums=("2880de70124f884e571772f1649ca5ab9c60f29020dbdb81e4d54f53a495bb109997446ab1ba569ccc0d402ac2c109a01ad3ed01e0c5b964a0c1028555f11fe4")

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

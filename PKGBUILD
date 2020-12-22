# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=listen1-desktop-appimage
_installdir=/opt/${pkgname}
pkgver=2.17.3
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1"
license=("MIT")
_pkgname="listen1_${pkgver}_linux_${arch}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("listen1")
conflicts=("listen1")
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("18029dbd2eff69fb299e909ca2e601ad6f39660b1f5679ab38aa2abe3c2663808560b94efb7312a277680b473c232b38027e33af35988cc26303a03f2d2acf6b")

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/listen1-desktop.AppImage+" "squashfs-root/listen1.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/listen1.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/listen1-desktop.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}


# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=listen1-desktop-appimage
_installdir=/opt/${pkgname}
pkgver=2.17.1
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
sha512sums=("88f223b45c2ba9416758fae9259d4ad10f0756fbcf2c2a560947a035cae2de256336fa1260ab0cb7ba9edb35165d0022006e062575db5a3d5d015b1aed8f1299")

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/listen1-desktop.AppImage+" "squashfs-root/listen1.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/listen1-desktop.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}


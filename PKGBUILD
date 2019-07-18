# Maintainer: gxb153 <maintainer at gmail dot com>

pkgname=listen1-desktop-appimage
pkgver=2.4.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1/"
license=("MIT")
makedepends=("p7zip")
noextract=("Listen1_${pkgver}_linux_x86_64.AppImage")
options=("!strip")
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage")
sha256sums=("cbe4a5aaf0d41b638e2aa4cf3dfd8a3e9ed9d51c01b7709db2fc9cb490707c51")

package() {
    cd "${srcdir}"
    mv "Listen1_${pkgver}_linux_x86_64.AppImage" "listen1.AppImage"
    7z x "${srcdir}/listen1.AppImage" listen1.desktop usr/share/icons/hicolor
    sed -i "s/AppRun/\/opt\/listen1\/listen1.AppImage/" listen1.desktop

    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -R "${srcdir}/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
    install -Dm755 "listen1.AppImage" "${pkgdir}/opt/listen1/listen1.AppImage"
    install -Dm644 "listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
}

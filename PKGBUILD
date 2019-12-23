# Maintainer: vvxxp8 <letters[g] in square[x] [b]rackets one[1] five[5] two[2] at gmail dot com>

pkgname=listen1-desktop-appimage
_installdir=/opt/${pkgname}
pkgver=2.5.1
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1/"
license=("MIT")
noextract=("Listen1_${pkgver}_linux_x86_64.AppImage")
options=("!strip")
provides=('listen1')
conflicts=('listen1')
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage")
sha256sums=("3b054e2c7fe0bc65a2f3e1823f489642293a2e958dd3f82b89097f3191ad5fb8")

package() {
    cd "${srcdir}"
    mv "Listen1_${pkgver}_linux_x86_64.AppImage" "listen1.AppImage"
    chmod a+x "listen1.AppImage"
    ${srcdir}/listen1.AppImage --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/listen1.AppImage %U+" "squashfs-root/listen1.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;

    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
    install -Dm755 "listen1.AppImage" "${pkgdir}/${_installdir}/listen1.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
}

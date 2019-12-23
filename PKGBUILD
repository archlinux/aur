# Maintainer: vvxxp8 <letters[g] in square[x] [b]rackets one[1] five[5] two[2] at gmail dot com>

pkgname=listen1-desktop-appimage
pkgver=2.5.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1/"
license=("MIT")
noextract=("Listen1_${pkgver}_linux_x86_64.AppImage")
options=("!strip")
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage")
sha256sums=("8c6a190fd0fa77ba5f0bf051f836bd9b706bea7c8aeb4436edb81f63e9bbe635")

package() {
    cd "${srcdir}"
    mv "Listen1_${pkgver}_linux_x86_64.AppImage" "listen1.AppImage"
    chmod a+x "listen1.AppImage"
    ${srcdir}/listen1.AppImage --appimage-extract
    sed -i "s/AppRun/env DESKTOPINTEGRATION=no \/opt\/${pkgname}\/listen1.AppImage %U/" "squashfs-root/listen1.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;

    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
    install -Dm755 "listen1.AppImage" "${pkgdir}/opt/${pkgname}/listen1.AppImage"
    install -Dm644 "squashfs-root/listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
}

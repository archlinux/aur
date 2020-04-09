# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
pkgname=copytranslator-appimage
_installdir=/opt/${pkgname}
pkgver=9.0.2
pkgrel=1
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=("any")
url="https://copytranslator.github.io"
noextract=("copytranslator-${pkgver}.AppImage")
options=("!strip")
source=("https://github.com/CopyTranslator/CopyTranslator/releases/download/v${pkgver}/copytranslator-${pkgver}.AppImage")
sha256sums=("38abb1add4f24a77afca17c1cd752d670b7675589709785076f762ca92378b48")

prepare() {
    cd "${srcdir}"
    mv "copytranslator-${pkgver}.AppImage" "copytranslator.AppImage"
    chmod a+x "copytranslator.AppImage"
    ${srcdir}/copytranslator.AppImage --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/copytranslator.AppImage %U+" "squashfs-root/copytranslator.desktop"
    sed -i "s+/opt/copytranslator/resources/linux-icon/icon.png+copytranslator+" "squashfs-root/copytranslator.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 "copytranslator.AppImage" "${pkgdir}/${_installdir}/copytranslator.AppImage"
    install -Dm644 "squashfs-root/copytranslator.desktop" "${pkgdir}/usr/share/applications/copytranslator.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}

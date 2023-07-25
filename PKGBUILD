# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="selenium-ide-appimage"
pkgver=4.0.0_alpha.45
pkgrel=1
pkgdesc="Open Source record and playback test automation for the web."
arch=('x86_64')
url="https://selenium.dev/selenium-ide/"
_githuburl="https://github.com/SeleniumHQ/selenium-ide"
license=('Apache')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver//_/-}/Selenium.IDE-${pkgver//_/-}.AppImage")
sha256sums=('3138ee19ca20a898daffed968766e1f08b4dc4b9b2b2c7d299e5f02e4e3f0a1b')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|/opt/${_install_path}/${pkgname%-appimage}.AppImage|g;s|@seleniumhq${pkgname%-appimage}|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/@seleniumhq${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/@seleniumhq${pkgname%-appimage}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/@seleniumhq${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}
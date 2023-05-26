# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="selenium-ide-appimage"
pkgver=4.0.0alpha.40
_subver=alpha.40
pkgrel=3
pkgdesc="Open Source record and playback test automation for the web."
arch=('x86_64')
url="https://selenium.dev/selenium-ide/"
_githuburl="https://github.com/SeleniumHQ/selenium-ide"
license=('Apache')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver%${_subver}}-${_subver}/Selenium.IDE-${pkgver%${_subver}}-${_subver}.AppImage")
sha256sums=('6de405b7d1eba0b9b697747ede0c6e51c4bf925e611877409cef9e96206e3185')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/selenium-ide.AppImage|g;s|@seleniumhqselenium-ide|selenium-ide|g' \
        -i "${srcdir}/squashfs-root/@seleniumhq${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/@seleniumhq${pkgname%-appimage}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/@seleniumhq${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}
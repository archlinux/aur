# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ostara-appimage"
pkgver=0.9.0
pkgrel=1
pkgdesc="A desktop application that provides various features to monitor and interact with Spring Boot Applications via Actuator."
arch=("x86_64")
url="https://ostara.dev/"
_githuburl="https://github.com/krud-dev/ostara"
license=('Apache')
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Ostara-${pkgver}.AppImage")
sha256sums=('3c3977e2407920ad9f6dca8e0dde304beaf8c1fe8b6a490c4102d244dc8747b2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/ostara.AppImage|g;s|@krud-devboost|ostara|g' -i "${srcdir}/squashfs-root/@krud-devboost.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/@krud-devboost.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/@krud-devboost.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png"
    done
}

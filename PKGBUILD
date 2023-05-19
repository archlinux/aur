# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="google-docs-appimage"
_appname="Google-Docs"
pkgver=2022.12.1
pkgrel=1
pkgdesc="Google Docs Desktop App made with electron. Includes Google Docs, Sheets, Slides, Forms, and Drive."
arch=("x86_64")
url="https://complabs.in/apps/google-docs"
_githuburl="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Google-Docs-linux-${arch}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/main/LICENSE")
sha256sums=('45252ba93971b3c3da8e2ca318aaa93836cb5ded700938d26548e76bfc3efb1a'
            'cd44ddffb7c00b09fa102c9ce08213cda2af5fedb070e01d5975fd41665551c7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/google-docs.AppImage|g;s|Google-Docs|google-docs|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
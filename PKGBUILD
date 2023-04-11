# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=js-design-appimage
pkgver=1.0.6
pkgrel=1
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=("x86_64")
url="https://js.design"
license=(GPL3)
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://img.js.design/assets/download/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1%20Linux%E7%89%88.AppImage"
    "LICENSE::${url}/terms")
sha256sums=('b9a066f187bd5b956643e6ad1439b5293989825ca480ebeed8d1ac1a1b657285'
            '8094d1200199010016c13c6ba98d493ce5d8777eb0b2b16f2ab6e568c0702234')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/js.design.AppImage|g;s|Icon=js.design|Icon=js-design|g' -i "${srcdir}/squashfs-root/js.design.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/js.design.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/js.design.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

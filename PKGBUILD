# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="picturama-appimage"
pkgver=1.3.0
pkgrel=1
pkgdesc="Digital image organizer powered by the web"
arch=("x86_64")
url="https://picturama.github.io/"
_githuburl="https://github.com/picturama/picturama"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Picturama-1.3.1.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/vcync/picturama/master/LICENSE.txt")
sha256sums=('a40fc27395841cf3220ed7db3ba98717d3b3a24fc1733b81759218fbd28c3e3a'
            'b8ff1b44d19d011a234dc2490176e17231321a397f742088679c6c96555aba25')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/picturama.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
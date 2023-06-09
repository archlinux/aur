# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ficus-appimage"
pkgver=0.1.9
pkgrel=1
pkgdesc="A software for editing and managing markdown documents, developed by the gg=G team."
arch=('x86_64')
url="https://ficus.world/"
_githuburl="https://github.com/Thysrael/Ficus"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/Thysrael/Ficus/main/LICENSE")
sha256sums=('9aa45108d33df4b65d493171457ebcd7029437286fd496afed75eed07e5c5f26'
            '062dfd6ae4c19f555ebbdba752598c98510837687393a38a3602b711890430d7')
     
prepare() {
    chmod a+x "ficus-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/ficus.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/ficus-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
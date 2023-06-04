# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="liground-appimage"
pkgver=0.4.0
pkgrel=1
pkgdesc="A free, open-source and modern Chess Variant Analysis GUI for the 21st century"
arch=('x86_64')
url="https://ml-research.github.io/liground.github.io/"
_githuburl="https://github.com/ml-research/liground"
license=('AGPL3')
depends=('zlib' 'glibc')
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-linux.AppImage")
sha256sums=('7d0c4994cb489689183b3768952d9199971060dd873037a988c25f8d86cc1ad4')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
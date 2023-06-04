# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="postbird-appimage"
pkgver=0.8.4
pkgrel=1
pkgdesc="Open source PostgreSQL GUI client for macOS, Linux and Windows"
arch=('x86_64')
url="https://github.com/Paxa/postbird"
license=('MIT')
depends=('glibc' 'zlib')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/Paxa/postbird/master/LICENSE")
sha256sums=('94498a3f6d9ad2ea9d344c25e20674290c1362fd5356ecf33eabc778fe2fd19e'
            'd93e84fa24bbea7e92d6cd171968d8da1f4a28047cc704f0700d17b57c7a9a9c')
 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
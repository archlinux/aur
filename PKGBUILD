# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yuvviewer-bin"
_appname=YUVviewer
pkgver=0.5.2
pkgrel=1
pkgdesc="A small tool for developers to view and preview various original image formats. It is based on Qt and opencv frameworks and supports windows/linux/macos."
arch=("x86_64")
url="https://github.com/QQxiaoming/YUVviewer"
license=('GPL3')
depends=('glibc' 'libxcb' 'fontconfig' 'libgpg-error' 'freetype2' 'libx11' 'libglvnd' 'xdg-utils' 'hicolor-icon-theme' 'gcc-libs' 'zlib')
provides=("QQxiaoming")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_appname}_Linux_V052_x86_64.deb")
sha256sums=('29654c0d39e469a02da3ee7f03dbe47e45b2c62654e0330ca5ed92938835b900')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed 's|/opt/YUVviewer/YUVviewer.png|yuvviewer|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
}
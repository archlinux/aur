# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ttfviewer-bin"
_appname=TTFviewer
pkgver=0.2.3
pkgrel=1
pkgdesc="A small tool for developers to view and preview various ttf font/icon image formats. It is based on Qt and opencv frameworks and supports windows/linux/macos."
arch=("x86_64")
url="https://github.com/QQxiaoming/TTFviewer"
license=('GPL3')
depends=('glibc' 'libxcb' 'fontconfig' 'libgpg-error' 'freetype2' 'libx11' 'libglvnd' 'xdg-utils' 'hicolor-icon-theme' 'gcc-libs' 'zlib')
provides=("QQxiaoming")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/TTFviewer_Linux_V023_x86_64.deb")
sha256sums=('23ded4dad1b3758303db96c8967e42badb33af6fc6ba28835c67c0966d50a02f')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed 's|/opt/TTFviewer/TTFviewer.png|ttfviewer|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
}
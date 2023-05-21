# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mogan-bin"
pkgver=1.2.0alpha5
_subver=alpha5
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_githuburl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
providers=()
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('qt5-svg' 'qt5-base' 'glibc' 'gcc-libs' 'gawk' 'hicolor-icon-theme' 'sqlite' 'sh' 'freetype2' 'zlib' 'libpng' 'libjpeg-turbo')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver%${_subver}}-${_subver}/${pkgname%-bin}-v${pkgver%${_subver}}-${_subver}-ubuntu22.04.deb")
sha256sums=('426053f33444568fc231ca6f4e990078d20e3dbe394a2a2a32a888ea883a624b')
 
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    gendesk -f --icon "Xmacs" --categories "Utility;Development" --name "${pkgname%-bin}" --exec "/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    rm -rf "${pkgdir}/usr/include"
}
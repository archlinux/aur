# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boats-animator-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Stop motion animation program created using Electron"
arch=('x86_64')
url="http://charlielee.uk/boats-animator"
_githuburl="https://github.com/charlielee/boats-animator"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('671e5743d742b154a6576257b58a92c013c9bed690d1787c73b433c89f9dbbab'
            'e51b8ebcd9d7949c95ff194b57645b56a57bb17207f55a8b65f70a6a44f020c6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Boats Animator/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    rm -rf "${pkgdir}/opt/${pkgname%-bin}/package-type"
    sed "s|\"/opt/Boats Animator/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}
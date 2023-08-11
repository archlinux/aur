# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boats-animator-bin
_appname="Boats Animator"
pkgver=0.13.0
pkgrel=3
pkgdesc="Stop motion animation program created using Electron"
arch=('x86_64')
url="http://charlielee.uk/boats-animator"
_githuburl="https://github.com/charlielee/boats-animator"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('671e5743d742b154a6576257b58a92c013c9bed690d1787c73b433c89f9dbbab'
            '72ff3e1e04a959e459881bd03b1af745e018969e8b964c23841123c269594db2')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    rm -rf "${pkgdir}/opt/${pkgname%-bin}/package-type"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}
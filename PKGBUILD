# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grx-bin
_appname=GRX
pkgver=2.1.3
pkgrel=3
pkgdesc="Fastest Web Gerber Renderer"
arch=('x86_64')
url="https://grx.creery.org/"
_githuburl="https://github.com/hpcreery/GRX"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('electron24' 'bash')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb"
    "https://raw.githubusercontent.com/hpcreery/GRX/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('8221259df476971fffd25bee80132d61d08ffe2088fc4688920ea8de7c720526'
            '6af73551667116d187b1a4e5dac0933f99a4c1151bd1a44c12249cd540a69444'
            '3be8cdb455bb6bfe4650cd8fd4cfdec28ea191dfd2a1754021de85a814d0e99c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
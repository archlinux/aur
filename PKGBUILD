# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=niconizer-bin
pkgver=2.0.106
pkgrel=1
pkgdesc="A desktop application that displays plain text, images, and any other HTML content on the screen."
arch=("x86_64")
url="https://github.com/matzkoh/niconizer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/matzkoh/niconizer/master/icon/icon_512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('373c543ed44902e476af700d5bb163fcc76affadedc5e6770930a0d12661cdb2'
            '7c820610080a8d47f26c555d498ae391c89f2848de93cde005f1fd438e1e0236'
            '3671c8945bdef98dcc423d1e2f60134bb3cf5463630ef4c673a614f66f621ff2')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
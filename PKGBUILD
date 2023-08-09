# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=niconizer-bin
pkgver=2.0.105
pkgrel=1
pkgdesc="A desktop application that displays plain text, images, and any other HTML content on the screen."
arch=("x86_64")
url="https://github.com/matzkoh/niconizer"
license=('MIT')
depends=('bash' 'electron25')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/matzkoh/niconizer/master/icon/icon_512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('081a685e9655f09661c3550ca9cbe74e2365e0f0ec537af40c6a5d102514d5bc'
            '7c820610080a8d47f26c555d498ae391c89f2848de93cde005f1fd438e1e0236'
            '3671c8945bdef98dcc423d1e2f60134bb3cf5463630ef4c673a614f66f621ff2')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
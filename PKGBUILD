# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=niconizer-bin
pkgver=2.0.108
pkgrel=1
pkgdesc="A desktop application that displays plain text, images, and any other HTML content on the screen."
arch=("x86_64")
url="https://github.com/matzkoh/niconizer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/matzkoh/niconizer/v${pkgver}/icon/icon_512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('034bcaddd67c6189067ed00fbe9ef7d927430f297bc3e58a8549eac07a38163c'
            '7c820610080a8d47f26c555d498ae391c89f2848de93cde005f1fd438e1e0236'
            'fc1fef7693124cf9fcd47724862f84bb0c795046636278021cf53697fedae89c')
prepare() {
    gendesk -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
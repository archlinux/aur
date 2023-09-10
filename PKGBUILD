# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shiba-bin
_pkgname=Shiba
pkgver=1.2.1
pkgrel=4
pkgdesc="Rich markdown live preview app with linter.This application is being re-written from scratch to V2,using Rust, TypeScript and React"
arch=('x86_64')
url="https://github.com/rhysd/Shiba"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron5')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/rhysd/Shiba/master/build/images/shibainu.png"
    "${pkgname%-bin}.sh")
sha256sums=('bce114feb8b6fccb6db4c933ed48d5fd0040c04ed30e16441b188320963d6fb7'
            'e94cd67aa4ba4e9ba4a90c939e3597caed218434e7d4c1e354495508bc1eae38'
            '4d76732789c0cdcd509aa68540fe5a9db2bed958cfa89f81f6af2c3de8090c8d')
prepare() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Shiba-linux-x64/resources/"* -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Shiba-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
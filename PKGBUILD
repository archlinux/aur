# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shiba-bin
pkgver=1.2.1
pkgrel=3
pkgdesc="Rich markdown live preview app with linter.This application is being re-written from scratch to V2,using Rust, TypeScript and React"
arch=('x86_64')
url="https://github.com/rhysd/Shiba"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron5')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Shiba-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/rhysd/Shiba/master/build/images/shibainu.png"
    "${pkgname%-bin}.sh")
sha256sums=('bce114feb8b6fccb6db4c933ed48d5fd0040c04ed30e16441b188320963d6fb7'
            'e94cd67aa4ba4e9ba4a90c939e3597caed218434e7d4c1e354495508bc1eae38'
            '0a0f034138d3ab2255e4225187e40dd0e09d7600f247b3d8b59d8bb5896f64cc')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/Shiba-linux-x64/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Shiba-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Shiba" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
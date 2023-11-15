# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mater-bin
_pkgname=Mater
pkgver=1.0.10
pkgrel=5
pkgdesc="A simple menubar Pomodoro app"
arch=('x86_64')
url="https://github.com/jasonlong/mater"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron11'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('b26d8ef79fd92c95ac914e73af9504f06dcfaa204f62c47cc3d423a53fa32f8a'
            '1a509bacaf57e8e5f40b74a09d8e1aa35834b53fcab3dbd6176b7c3df56d82f7')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    find "${srcdir}/${_pkgname}-linux-x64" -type d -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}-linux-x64/resources/app" -type f -exec chmod 644 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
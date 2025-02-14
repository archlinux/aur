# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aione-bin
_pkgname=AIOne
pkgver=1.0.0
_electronversion=33
pkgrel=2
pkgdesc="An all-in-one AI desktop app that provides access to ChatGPT, Gemini and Claude.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://sumexxx.github.io/AIOne/"
_ghurl="https://github.com/SUMExXx/AIOne"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('1e9e68999268d9d3c7169fca60d0fce22f784c0d0118a79adcad29a6606ae444'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stremio-web-desktop-bin
_pkgname='Stremio Web Desktop'
pkgver=65
_subver=1.0.0
_electronversion=33
pkgrel=1
pkgdesc="Stremio Web as Electron Desktop App. Latest Stremio Web v5 and Server bundled as electron app.Not affiliated with Stremio in any way.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Zaarrg/stremio-web-desktop"
license=(
    'GPL-3.0-only'
    'MIT'
)
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${_subver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('82b43ca83abb69c07ff9fcd43c0ae0cf2ce1c581ca6b45ea083cd6d9525b86f0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

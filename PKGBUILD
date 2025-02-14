# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cmc-mod-manager-bin
pkgver=3.1.2
_electronversion=30
pkgrel=2
pkgdesc="Fully Functional & Somewhat Popular | A mod manager for the CMC+ v8 (Crusade Modding Community Plus Version 8) build of SSBC (Super Smash Brothers Crusade).(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://inferno214221.com/cmc-mod-manager"
_ghurl="https://github.com/Inferno214221/cmc-mod-manager"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('d571244ca5b7ff1f34f0aa043e07580c6d3cd2eae55e5573484a9ea0fcce88dd'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
preapre() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
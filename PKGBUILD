# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=animestream-bin
pkgver=1.0.0
_subver=alpha_3
_electronversion=27
pkgrel=7
pkgdesc="A simple project designed for streaming and downloading your favorite anime!(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/frostnova721/animestream-electron"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}-${_subver}.deb::${url}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('01c928a44d8574b448800ddecb460cfcc63e1409e0e5528070677dfa8382705d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
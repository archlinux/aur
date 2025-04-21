# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sshuttle_gui
pkgname="${_pkgname//_/-}-bin"
pkgver=0.3
pkgrel=2
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-gui-bin}"
)
depends=(
    'gtk2'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('66515c4867c998aceb54339c3be68da6ea9f8b53733a565f6fc54c103b57446d'
            'f17d69f73b4368b9f95510801b1aa2fb1f47e056ad78075dfa14ef15b97939fc')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
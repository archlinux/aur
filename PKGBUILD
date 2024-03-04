# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sshuttle_gui
pkgname="${_pkgname//_/-}-bin"
pkgver=0.2
pkgrel=6
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh."
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-gui-bin}"
)
depends=(
    'gtk2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9fccc06d6a60b369371fd4a204dca0cd4efc05e060682773815a3e48cc786bb5'
            '55b0c886747be51fb73201b63809f4d9849d3e7f8f7e1c4c2276755c44b70145')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
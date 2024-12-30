# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="A small and nimble GUI for XRay.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk2'
    'p7zip'
    'wget'
    'zenity'
    'systemd'
    'gtk2'
    'libproxy'
    'fping'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('5c06031f824dac762295db67a8f6f8f65fbccfba79202c377ebc275b3645c011'
            '2603edafb8afdc7a9984f667bee03cc7c9d71f17f43ed2bb072e5bcf9726b6e4')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib/"
    install -Dm644 "${srcdir}/etc/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
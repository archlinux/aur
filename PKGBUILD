# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sshuttle-gui-bin
pkgver=0.2
pkgrel=4
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh."
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-gui-bin}"
)
depends=(
    'gdk-pixbuf2'
    'gtk2'
    'at-spi2-core'
    'pango'
    'cairo'
    'libx11'
    'sshuttle'
    'sshpass'
    'gtk2'
    'polkit'
    'fping'
    'systemd'
    'iptables'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb"
)
sha256sums=('9fccc06d6a60b369371fd4a204dca0cd4efc05e060682773815a3e48cc786bb5')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|usr/share|opt|g" -i "${srcdir}/usr/bin/${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/all/etc/systemd/system/sshuttle.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
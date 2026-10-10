# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adbmanager-bin
pkgver=4.1
pkgrel=1
pkgdesc="ADB manager for Android devices."
arch=('x86_64')
url="https://github.com/AKotov-dev/adbmanager"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'android-tools'
    'iproute2'
    'nmap'
    'gtk2'
    'sakura'
    'qt6pas'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx10.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('90803bd141b49b6205d16edb78dfae18c9891e7d62495166958aa9d875aa8b9a'
            'b046dc662796f382c9300642d94724a97c20baf60de1fe9b34844a6a735aaf7d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=10.2.9
_releasedate=202509200646
pkgrel=1
pkgdesc="Easy to Use / Practical / Powerful / Modern (Prebuilt version)一款易用、实用、强大、现代的跨平台终端"
arch=('x86_64')
url="http://woterm.com/"
_ghurl="https://github.com/aoyiduo/woterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=("!strip")
depends=(
    'qt6-5compat'
    'qt6-virtualkeyboard'
    'qt6-quicktimeline'
    'qt6-serialport'
    'qt6-scxml'
    'openssl-1.1'
    'gtk3'
    'qt6-charts'
    'qt6-declarative'
    'libssh'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}-portable-v10.2.8-${_releasedate}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('e6705778bf8186d159effda6e4cf74e62ac2be4c3f232e6ccfd38fc231c12728'
            '2c72a969289598f9c407cb36a9720ad3b6a85173551252369515a0422cc53077')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v10.2.8-${_releasedate}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v10.2.8-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
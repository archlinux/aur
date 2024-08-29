# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=10.1.1
_releasedate=202407202117
pkgrel=1
pkgdesc="支持常见的主流通迅协议SSH1/SSH2/SFTP/TELNET/RLOGIN/RDP/VNC/SHELL/SERIALPORT/TCP/UDP的一个跨平台工具."
arch=("x86_64")
url="http://woterm.com/"
_ghurl="https://github.com/aoyiduo/woterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=("!strip")
depends=(
    'qt5-base'
    'postgresql-libs'
    'qt5-location'
    'qt5-declarative'
    'unixodbc'
    'openssl-1.1'
    'gtk3'
    'qt5-remoteobjects'
    'qt6-charts'
    'qt6-declarative'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://down.woterm.com/linux/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('74061e28c9aba459f214856284223cb16f542db868d21beb7d73a246b37c7a42'
            '2ffd75f3b13e9ea201de646ecd8d807cd9dec00459b8a8f1591d1fbb9423bbd8')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
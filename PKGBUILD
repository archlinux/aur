# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=9.29.10
_releasedate=202312241653
pkgrel=1
pkgdesc="支持常见的主流通迅协议SSH1/SSH2/SFTP/TELNET/RLOGIN/RDP/VNC/SHELL/SERIALPORT/TCP/UDP的一个跨平台工具."
arch=("x86_64")
url="http://woterm.com/"
_ghurl="https://github.com/aoyiduo/woterm"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=("!strip")
depends=(
    'freetype2'
    'at-spi2-core'
    'qt5-base'
    'libxcb'
    'postgresql-libs'
    'qt5-location'
    'libglvnd'
    'pango'
    'qt5-declarative'
    'libx11'
    'fontconfig'
    'libxkbcommon-x11'
    'libxext'
    'libxkbcommon'
    'cairo'
    'unixodbc'
    'libxrender'
    'gdk-pixbuf2'
    'openssl-1.1'
    'gtk3'
    'qt5-remoteobjects'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://down.woterm.com/linux/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('97add1e20bccbf296c7ac561226e13dbc67629e3a7e3a076082c8442a7b6936d'
            'fdeeff9d7e5a7af5519df478763fdd2819b686adc4c5e9003fcc511e981294ad')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=9.29.8
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
    'dbus'
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
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64-v${pkgver}-202311132114.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('f28fbcf310437f958f1b42c1912a3c1d6415ad88a517a440ac697faf636fb8d3'
            'f624a670d9bbea6fd84d6867cd86dabb4690ec2fd4bd5b9bd27180aa58d81345')
build() {
    gendesk -q -f -n --categories "Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x86_64-v${pkgver}-202311132114/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x86_64-v${pkgver}-202311132114/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
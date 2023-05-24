# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="simple-irc-client-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop clients for Simple Irc Client"
arch=('x86_64')
url="https://github.com/Simple-Irc-Client/desktop"
license=('AGPL3')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('libxdamage' 'alsa-lib' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'mesa' 'cairo' 'at-spi2-core' 'glibc' 'libxcomposite' \
    'nss' 'expat' 'libxfixes' 'glib2' 'libdrm' 'libxext' 'pango' 'gtk3' 'libxcb' 'dbus' 'libcups' 'libx11' 'nspr')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8e6a71e380c73061185c8e0c206999a733df3b4be4a4c8c01a9e444c050eb6fc')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed 's|Exec=simple-irc-client|Exec=/opt/simple-irc-client/simple-irc-client|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fmedia-bin
pkgver=1.31
pkgrel=2
pkgdesc='Fast media player/recorder/converter'
arch=('i686' 'x86_64')
url='https://stsaz.github.io/fmedia'
_githuburl="https://github.com/stsaz/fmedia"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'jack' 'libpulse' 'dbus' 'glib2' 'gdk-pixbuf2' 'alsa-lib' 'glibc' 'pango' 'at-spi2-core' 'cairo')
makedepends=('imagemagick')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.xz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.xz")
sha256sums=('9f2347b0316275b081e98feaaed8b17c4750c2855f85606b79b26f6e62ba8ab0')
prepare() {
    sed "s|~/bin/${pkgname%-bin}-1/${pkgname%-bin}.ico|${pkgname%-bin}|g;s|=Audio|=AudioVideo;|g" \
        -i "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.desktop"
    convert "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.ico" "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-1/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
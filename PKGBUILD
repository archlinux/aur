# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpha-badger-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="UI wrapper around FFmpeg"
arch=('x86_64')
url="https://github.com/NoamRa/alpha-badger"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('ffmpeg' 'libxkbcommon' 'gtk3' 'libcups' 'nspr' 'at-spi2-core' 'nss' 'libxrandr' 'libxcomposite' 'libxdamage' 'libxfixes' \
    'libxcb' 'expat' 'glibc' 'libxext' 'alsa-lib' 'mesa' 'dbus' 'pango' 'glib2' 'cairo' 'libdrm'  'libx11' 'gcc-libs')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a77a67190313ae9126fa6a8ad677f54b44abf21759dfb289de2be3d3599b354e')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    npm install
    npm run-script package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/out/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/brand/Alpha_Badger_logo_1920x960.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "AudioVideo;Utility" --name "Alpha-Badger" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
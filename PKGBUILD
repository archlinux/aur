# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpha-badger
_appname=Alpha-Badger
pkgver=0.4.1
pkgrel=2
pkgdesc="UI wrapper around FFmpeg"
arch=('x86_64')
url="https://github.com/NoamRa/alpha-badger"
license=('MIT')
conflicts=("${pkgname}")
depends=('ffmpeg' 'libxkbcommon' 'gtk3' 'libcups' 'nspr' 'at-spi2-core' 'nss' 'libxrandr' 'libxcomposite' 'libxdamage' 'libxfixes' \
    'libxcb' 'expat' 'glibc' 'libxext' 'alsa-lib' 'mesa' 'dbus' 'pango' 'glib2' 'cairo' 'libdrm'  'libx11' 'gcc-libs')
makedepends=('nodejs' 'npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a77a67190313ae9126fa6a8ad677f54b44abf21759dfb289de2be3d3599b354e')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/brand/${_appname//-/_}_logo_1920x960.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo;Utility" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
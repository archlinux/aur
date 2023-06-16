# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="autocut-client-bin"
pkgver=0.1.7
pkgrel=1
pkgdesc="Quickly generate video subtitles and edit the video by selecting subtitle clips"
arch=('x86_64')
url="https://github.com/zcf0508/autocut-client"
license=('MIT')
depends=('gtk3' 'nspr' 'pango' 'libdrm' 'at-spi2-core' 'cairo' 'nss' 'libxext' 'expat' 'glib2' 'mesa' 'glibc' 'libxcb' 'wayland' \
    'libxrandr' 'libxkbcommon' 'libxfixes' 'libx11' 'dbus' 'gcc-libs' 'libxcomposite' 'alsa-lib' 'libcups' 'libxdamage' 'ffmpeg')
makedepends=('pnpm')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.desktop")
sha256sums=('8da25341df954439d26b7921736e0539530f1d6b2bc392c826242a68007df990'
            '4e11ebe09d2a10b6534f02961a12de11e0304d2d6f862effd1ae65686cc7850c')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    pnpm install && pnpm run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/release/v${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/dist/node.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
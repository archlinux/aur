# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
pkgver=1.3.12.01
pkgrel=3
pkgdesc='A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music'
arch=('x86_64')
url="https://www.xunscore.cn/"
_giteeurl="https://gitee.com/xunscore/xunapp"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libglvnd' 'glib2' 'libxrender' 'glibc' 'libx11' 'dbus' 'gst-plugins-base-libs' 'libxext' 'libxkbcommon' 'gcc-libs' \
    'zlib' 'fontconfig' 'libxkbcommon-x11' 'gstreamer' 'libpulse' 'freetype2' 'libxcb' 'alsa-lib' 'libsndfile')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_giteeurl}/releases/download/v${pkgver}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "LICENSE::${_giteeurl}/blob/v${pkgver}/README.md"
    "${pkgname%-bin}.png::https://foruda.gitee.com/avatar/1677181395504012245/9611953_xunscore_1629422881.png")
sha256sums=('16a8e687cc1b4f5f60eec42c07b888d60e16a15ca94fe76cdc6f13dc08478b7b'
            '2badb3ea39a035a0e37ef014471f82fd736d8115c535358bec8854ba193ede4d'
            '025373ba75679076a9a681b69057b632b17195cc9c3ece1192104efabbcae324')
prepare() {
    gendesk -f -n --categories "AudioVideo" --name "Xunscore" --exec "${pkgname%-bin}"
    chmod 644 "${srcdir}/${pkgname%-bin}/soundfonts/metronome.sf2"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
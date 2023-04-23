# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xunscore-bin"
pkgver=1.3.12.01
pkgrel=2
pkgdesc="A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music"
arch=('x86_64')
url="https://www.xunscore.cn/"
_giteeurl="https://gitee.com/xunscore/xunapp"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('libglvnd' 'glib2' 'libxrender' 'glibc' 'libx11' 'dbus' 'gst-plugins-base-libs' 'libxext' 'libxkbcommon' 'gcc-libs' \
    'zlib' 'fontconfig' 'libxkbcommon-x11' 'gstreamer' 'libpulse' 'freetype2' 'libxcb' 'alsa-lib' 'libsndfile')
options=()
source=("${pkgname%-bin}-${pkgver}.zip::${_giteeurl}/releases/download/v${pkgver}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "LICENSE::${_giteeurl}/raw/master/README.md")
sha256sums=('16a8e687cc1b4f5f60eec42c07b888d60e16a15ca94fe76cdc6f13dc08478b7b'
            '39e25eae0d94a0ea4b8a84cfa75b7e218f688c1ee71295d5d92cbdf6fc97f123')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    chmod 644 "${pkgdir}/opt/${pkgname%-bin}/soundfonts/metronome.sf2"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility;AudioVideo" --name "Xunscore" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
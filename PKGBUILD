# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
pkgver=1.3.13
pkgrel=2
pkgdesc='A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music'
arch=('x86_64')
url="https://www.xunscore.cn/"
_giteeurl="https://gitee.com/xunscore/xunapp"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libglvnd'
    'libxrender'
    'libx11'
    'gst-plugins-base-libs'
    'libxext'
    'libxkbcommon'
    'fontconfig'
    'libxkbcommon-x11'
    'gstreamer'
    'libpulse'
    'freetype2'
    'libxcb'
    'alsa-lib'
    'libsndfile'
    'qt5-base'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_giteeurl}/releases/download/${pkgver}/${pkgname%-bin}-ubt-${pkgver}.02.zip"
    "LICENSE-${pkgver}::${_giteeurl}/blob/${pkgver}/README.md"
    "${pkgname%-bin}.png::https://foruda.gitee.com/avatar/1677181395504012245/9611953_xunscore_1629422881.png"
)
sha256sums=('53027cd57be24ed6b41c870830a3a10b5a8558c0064f3f20caff5fc03d5b2d2d'
            '11d2dc49a28a036999a95f401e6919b18b840a25ba1e3fc693a09713bfe2e70e'
            '025373ba75679076a9a681b69057b632b17195cc9c3ece1192104efabbcae324')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "Xunscore" --exec "${pkgname%-bin}"
    chmod 644 "${srcdir}/${pkgname%-bin}/soundfonts/metronome.sf2"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
pkgver=1.3.13.01
pkgrel=1
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
source=("${pkgname%-bin}-${pkgver}.zip::${_giteeurl}/releases/download/${pkgver}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "LICENSE::${_giteeurl}/blob/${pkgver}/README.md"
    "${pkgname%-bin}.png::https://foruda.gitee.com/avatar/1677181395504012245/9611953_xunscore_1629422881.png")
sha256sums=('47e492bb4216672bf7146db3e37136a23b6e8572da7decc742e912139f7ab512'
            'ee61b99c1bfbcd9df63d5b59758d5a9c10a4f53db698d83b794968441438565c'
            '025373ba75679076a9a681b69057b632b17195cc9c3ece1192104efabbcae324')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "Xunscore" --exec "${pkgname%-bin}"
    chmod 644 "${srcdir}/${pkgname%-bin}/soundfonts/metronome.sf2"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
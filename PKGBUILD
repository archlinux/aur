# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xm-video-player-bin
pkgver=0.5.1
pkgrel=2
pkgdesc="A high-quality client that supports playing multiple streaming formats such as MP4, M3U8, FLV, mpeg flash, etc.一款高颜值的支持播放mp4, m3u8,flv,mpeg-dash等多种流媒体格式的客户端"
arch=("x86_64")
url="https://tauri-update-server-chi.vercel.app/"
_ghurl="https://github.com/singcl/XmVideoPlayer"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'openssl-1.1'
    'pango'
    'webkit2gtk'
    'gtk3'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/singcl/XmVideoPlayer/v${pkgver}/LICENSE"
)
sha256sums=('0b9b0ce028241b6e303ee86d61f3a6dba94c44597e9260be81e07c7b78a01d55'
            '37231024f052817f3bc0e2f73047cca63feb6c18bbe443e3bcbfbd2d28cfab3d')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
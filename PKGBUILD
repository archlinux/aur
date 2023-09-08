# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xm-video-player-bin
pkgver=0.4.13
pkgrel=2
pkgdesc="A high-quality client that supports playing multiple streaming formats such as MP4, M3U8, FLV, mpeg flash, etc.一款高颜值的支持播放mp4, m3u8,flv,mpeg-dash等多种流媒体格式的客户端"
arch=("x86_64")
url="https://tauri-update-server-chi.vercel.app/"
_githuburl="https://github.com/singcl/XmVideoPlayer"
license=('BSD')
depends=('glib2' 'cairo' 'dbus' 'openssl-1.1' 'pango' 'gcc-libs' 'webkit2gtk' 'gtk3' 'gdk-pixbuf2' 'glibc' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/singcl/XmVideoPlayer/v${pkgver}/LICENSE")
sha256sums=('eb009e3f3004367f0ddab8472c53d87a582e1a6dfbce1120f5473fd548b099d2'
            '37231024f052817f3bc0e2f73047cca63feb6c18bbe443e3bcbfbd2d28cfab3d')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
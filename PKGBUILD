# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=res-downloader-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Download common network resources such as video accounts, mini programs, Douyin, Kuaishou, Xiaohongshu, live streams, m3u8, Kugou, QQ Music, etc.(Prebuilt version)视频号、小程序、抖音、快手、小红书、直播流、m3u8、酷狗、QQ音乐等常见网络资源下载!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/putyy/res-downloader"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
optdepends=(
    'motrix: A full-featured download manager.'
    'gopeed: High speed downloader that supports all platforms.'
    'imfile: A full-featured download manager.Forked from motrix.'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.deb")
sha256sums_aarch64=('8a937ff613429314f0d85a0ec47adf416a0b731c8f97b6cb2c7895e58dc1f181')
sha256sums_x86_64=('c69e47e083faec4a862603dc1ccdd7609a103e06c9a90fe2e6237635ef301052')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/local\/bin\///g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g
        s/Utility/Network/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
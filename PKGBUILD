# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=res-downloader-bin
pkgver=3.1.3
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
sha256sums_aarch64=('b8e94b06c9e45487bb8aafb7e97ffe1c2246e3b9daa9ae78512338986f201f87')
sha256sums_x86_64=('b450b7d416a394238e189faa1b6a293f6aeacef8d7f771feb4ff129cb63c43c0')
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

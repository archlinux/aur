# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=res-downloader-bin
pkgver=3.1.2
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
sha256sums_aarch64=('34faaae0b86bacb6c14dc7097ec7e8d469b64a0d344d7898619a8f2a1217877a')
sha256sums_x86_64=('0bb83e1bd4d2f5ea7ed9cea4e06f720806f4c823816ac17a54e0c61d7f56b0d7')
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

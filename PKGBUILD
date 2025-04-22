# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=res-downloader-bin
pkgver=3.0.4
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
sha256sums_aarch64=('46fe681a1d196766cf3e83cc29e9b1429b24f8d12589cf44be63764456d1fed1')
sha256sums_x86_64=('7c6ad354186c6d1712f262533162b523d70d0b20a126ccbfa177cd70b63ccbdf')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/usr\/local\/bin\///g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g
        s/Utility/Network/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
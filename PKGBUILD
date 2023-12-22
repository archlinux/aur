# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=splayer-bin
_pkgname=SPlayer
pkgver=2.0.0_beta.4
pkgrel=2
pkgdesc="A minimalist music player.一个简约的在线音乐播放器，支持网易云音乐账号登录，逐字歌词，下载歌曲，展示评论区，音乐云盘及歌单管理"
arch=(
    'x86_64'
)
url="https://music.imsyy.top/"
_ghurl="https://github.com/imsyy/SPlayer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libxcb'
    'libxfixes'
    'libxcomposite'
    'nspr'
    'libxkbcommon'
    'nss'
    'libcups'
    'libxext'
    'pango'
    'alsa-lib'
    'libxrandr'
    'cairo'
    'mesa'
    'at-spi2-core'
    'libxdamage'
    'libdrm'
    'libx11'
    'expat'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
)
sha256sums=('d9428682cb119c97b5df0180a60c912f1bb864f1ee07a0230b9e129a7ce03697')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|Music;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
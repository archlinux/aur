# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=splayer-bin
_pkgname=SPlayer
pkgver=2.0.1
_electronversion=28
pkgrel=1
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('0e62a4aefcc9bfcad6611b031be5f3433630d99833f1875cb44c2b7f479794b2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin} --no-sandbox|g;s|Music;|AudioVideo;|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-you-bin
pkgver=3.0.0_alpha.3
pkgrel=1
pkgdesc="一个美观简约的Material Design 3 (Material You) 风格网易云音乐播放器pc客户端"
arch=('x86_64')
url="https://v-player-git-dev-gumengyu.vercel.app/"
_ghurl="https://github.com/GuMengYu/music-you"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'mesa'
    'libxext'
    'libdrm'
    'gtk3'
    'libx11'
    'nspr'
    'alsa-lib'
    'libcups'
    'nss'
    'libxcb'
    'dbus'
    'libxcomposite'
    'expat'
    'libxdamage'
    'pango'
    'libxfixes'
    'cairo'
    'at-spi2-core'
    'libxkbcommon'
    'libxrandr'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
)
sha256sums=('5212df30434c23bd3a2c09190436cfdab356f5c4c467c9649a194b4e90c5beb8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|Audio;Music|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
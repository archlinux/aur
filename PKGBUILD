# Maintainer: CristianCYAC <cristianyasprillac at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quark-player-bin
_pkgname="Quark Player"
pkgver=3.4.1
pkgrel=1
pkgdesc="An Electron based Web Video Services Player, supporting Netflix, Youtube, Twitch, Floatplane, Hulu and More!"
arch=('x86_64')
url="https://github.com/Alex313031/quark-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'pango'
    'expat'
    'mesa'
    'libdrm'
    'libxcb'
    'libxfixes'
    'nss'
    'hicolor-icon-theme'
    'libxkbcommon'
    'cairo'
    'libxrandr'
    'at-spi2-core'
    'libxdamage'
    'libx11'
    'libxext'
    'nspr'
    'libcups'
    'libxcomposite'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://raw.githubusercontent.com/Alex313031/quark-player/v${pkgver}/LICENSE.md"
)
sha256sums=('844062382a7406c7758cc516749420d3c5bcc5fddad918602f1474d8b9960286'
            '5a32ae8d087f9c0efaddb5023680ceba32c31f55dd956f75778372e2de234c0a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
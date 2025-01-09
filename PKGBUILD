# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yyetsbot-bin
_pkgname=YYeTsBot
pkgver=0.1.0
pkgrel=1
pkgdesc="🎬 Renren Film and TV Robot and website, containing all resources of Renren Film and TV as well as many netizens' cloud disk sharing.(Prebuilt version)人人影视 机器人和网站，包含人人影视全部资源以及众多网友的网盘分享"
arch=('x86_64')
url="https://github.com/tgbot-collection/YYeTsBot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgname%-bin}-app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tgbot-collection/YYeTsBot/${pkgname%-bin}-app-v${pkgver}/LICENSE"
)
sha256sums=('b798a02f584fd623dd039a4c0897aa903d5709180a09f6b4b717976e81ecf35b'
            '6b80980b9084834f15e201cbce41f505738922b541cda1d524f695252540a71f')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Development/AudioVideo/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(192x192 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=webos-dev-manager-bin
pkgver=1.99.16
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('5111c45e21dd8590d5b44093045778946195d3036c83416db69498a12be0e912')
sha256sums_aarch64=('aaf3684647199bccd33a7a75cf9bbcc0a9a9088f14b346be4a2a4c480872e685')
sha256sums_x86_64=('75557895cb07c48bb29c054f0b187b5426d37c5e5fb28cadda78cbfb1158c0fa')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
        s/@options@/WEBKIT_DISABLE_DMABUF_RENDERER=1/g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}

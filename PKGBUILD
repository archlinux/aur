# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=webos-dev-manager-bin
_pkgname=devman
pkgver=1.99.4
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-1.99.3-1.${CARCH}.rpm")
sha256sums=('d1efff15dbe0be392882c5a43cd5a4a6021963311eed38249021738de465ebdc')
prepare() {
    sed -i "s/${_pkgname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
}
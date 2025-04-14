# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=webos-dev-manager-bin
pkgver=1.99.13
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('674bbc8662e7b1492dea2014f057b1499eccb03ab2bb405b9b8a16193b21006b')
sha256sums_x86_64=('5ec84af1c6ef921a1b616550c937270e4d3dd10ad81ae11d441664815c308619')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}

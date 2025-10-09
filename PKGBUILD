# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-light-bin
_pkgname=GitLight
pkgver=0.17.6
pkgrel=2
pkgdesc="🐙 GitHub & GitLab notifications on your desktop.(Prebuilt version)"
arch=('x86_64')
url="https://gitlight.app/"
_ghurl="https://github.com/colinlienard/gitlight"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'libsoup'
    'openssl-1.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/gitlight-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/colinlienard/gitlight/gitlight-v${pkgver}/LICENSE"
)
sha256sums=('c88f3ed7af7fefb959d464895c7ad20e47943089d7bd7c509a31e89e9757e2b3'
            '3e1267c6a0ddcacdfb7cd419c4a9c51522d4d5103a7ea97b34f53e4b31bee250')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
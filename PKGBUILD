# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=muzik-offline-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A cross platform, local music player.(Prebuilt version)"
arch=('x86_64')
url="https://muzik-apps.github.io/muzik-web/"
_ghurl="https://github.com/muzik-apps/muzik-offline"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/muzik-apps/muzik-offline/v${pkgver}/LICENSE"
)
sha256sums=('4e491cc7708a0d123fc369b309afda991e449622d4df3a8579d23bc77d0fb679'
            '6974cb23d06cf028e37ffbb2a90b608606b1cac5ba44de6b6d9198d83ae7591a')
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

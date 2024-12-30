# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jet-pilot-bin
_pkgname='JET Pilot'
pkgver=1.31.1
pkgrel=1
pkgdesc="An open-source Kubernetes desktop client that focuses on less clutter, speed and good looks.(Prebuilt version)"
arch=('x86_64')
url="https://jet-pilot.app/"
_ghurl="https://github.com/unxsist/jet-pilot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unxsist/jet-pilot/v${pkgver}/LICENSE"
)
sha256sums=('39ed053d81bad32f91e01cd1d1fc42aad1fe0e69bb3089a16f1cd07ba9e58c95'
            '508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
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
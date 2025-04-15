# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomota-bin
pkgver=0.0.7
pkgrel=7
pkgdesc="A simple user-friendly cross-platform tauri based pomodoro timer app that forces you to take a break.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/p32929/pomota"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/p32929/pomota/app-v${pkgver}/LICENSE"
)
sha256sums=('352161b3791c2f95026457f02326b40ae24a771e93ca6b6e62a83813ceecf8b3'
            'e3c1038536eb14a593ec4d00bceccbaa4f531674adc2dd53c4be34851b0eb8b7')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
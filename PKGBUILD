# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inner-ink-bin
_pkgname="Inner Ink"
pkgver=2.2.0
pkgrel=1
pkgdesc="A Diary app made with Tauri & React for desktop"
arch=("x86_64")
url="https://github.com/knownasnaffy/inner-ink"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/knownasnaffy/inner-ink/v${pkgver}/LICENSE"
)
sha256sums=('2260cfab433bbedce5ecedfd3a0ea5e62a9c833af6c8212a47ad1acbc2f02d84'
            '35e25d7ed25ecd3a68185e9ab59b4229c3c4e5957d14bb7737c3fc18af55b766')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
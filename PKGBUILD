# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salvage-bin
_pkgname=Salvage
pkgver=2.0.0
pkgrel=1
pkgdesc="Copy files comfortably and automate your backups."
arch=('x86_64')
url="https://github.com/RenanSui/salvage"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/RenanSui/salvage/main/LICENSE"
)
sha256sums=('e9aa9fc167d4c888209c942fee3844a032c146d068687b7f5dc034f946a77a2e'
            '4142643d16339ecf5a03a14940a2e28f78f3914b2eab0de4430d0a44ae1777c1')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
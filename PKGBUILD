# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=web-os-dev-manager-bin
pkgver=1.12.5
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'gtk3'
    'webkit2gtk'
    'libsoup'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('30bd74a6c396ed9f0e326c4e6cfb8a311d4f6e484469e2e076278b1ad4d3cb1c')
sha256sums_x86_64=('1f704d5790ce42ec451fe5780a6f3ed453d612e7748ea77b16c9694696a98ad3')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}
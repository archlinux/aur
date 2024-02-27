# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=darkwrite-bin
pkgver=1.0.0_alpha.2
pkgrel=4
pkgdesc="The eye-candy note taking and to-do application for all desktops"
arch=('x86_64')
url="https://github.com/astudentinearth/darkwrite"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
)
sha256sums=('9f4f08f5c411d491ea24039c5905292b1b52ef945d114adb741b1af0923dea6a')
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
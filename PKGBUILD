# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webeep-sync-bin
_appname=webeep-sync
pkgver=1.0.3
pkgrel=2
pkgdesc="Keep all your WeBeep files synced on your computer!"
arch=('x86_64')
url="https://github.com/toto04/webeep-sync"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-debian.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8e77681185c6795fbfbf038a5cde95f78c2aadf19108804fb1a4d64c6d2c615a'
            '3c99e0e787f5906b1e80dd44f3ea89784891a4e9cdbb5326cf0cd75e007f17c9')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 32x32 48x48 64x64 96x96 128x128 256x256;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
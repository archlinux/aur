# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=magic-eye-bin
_pkgname=Magic.Eye
pkgver=0.9.3
pkgrel=1
pkgdesc="A simple GUI interface for setting a live view from a camera"
arch=("x86_64")
url="https://github.com/Sir-Thom/Magic-eye"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v.${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Sir-Thom/Magic-eye/v.${pkgver}/LICENSE"
)
sha256sums=('df7388e78aafe44a9e86de85df58badfb6f45012c9821fb6085e8d54b754df73'
            '6788ec06d504c4fdf4e7ba5f8fc693af6fd601bbfce5de039fbe2a4bab537f32')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Categories=|Categories=Utility;|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/assets/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/assets"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
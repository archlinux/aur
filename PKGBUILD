# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sub-trans-bin
_pkgname="Panfu Desktop"
pkgver=0.3.1
pkgrel=2
pkgdesc="A GUI tool swap subtitle between tchinese and schinese"
arch=("x86_64")
url="https://github.com/dreamfliper/subTrans"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'pango'
    'gtk3'
    'openssl'
    'webkit2gtk'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('14cb85606b6a01cf7a4bae02dc646fc0947bc9aada5debbfac5e07977d320a56')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=only-refs-bin
_pkgname="OnlyRefs"
pkgver=0.0.4
pkgrel=1
pkgdesc="Organize all of your refences, notes, bookmarks and more ... 🌃"
arch=("x86_64")
url="https://github.com/Fantasy-programming/Onlyrefs"
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
)
sha256sums=('aef808afcef0c02fbee751797940a85e4464fdc5c61087f789000e42a0cd4de2')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Name=${pkgname%-bin}|Name=${_pkgname}|g;s|Categories=|Categories=Utility;|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
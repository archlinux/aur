# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mark-flowy-bin
_pkgname=MarkFlowy
pkgver=0.9.2
pkgrel=1
pkgdesc="Modern markdown editor application, Build fast and efficient workflows."
arch=("x86_64")
url="https://markflowy.vercel.app/"
_ghurl="https://github.com/drl990114/MarkFlowy"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${CARCH}.deb"
)
sha256sums=('5d9530b82b715570e7126559d81b768cdd8ea5f84b7dd10f03a75ac612359c7c')
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
}
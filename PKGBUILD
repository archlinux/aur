# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hosts-switch-bin
_pkgname='Hosts Switch'
pkgver=0.1.5
pkgrel=1
pkgdesc="Hosts Switch is created by wails. And it's an easy way to manage your hosts.(Prebuilt version)"
arch=('x86_64')
url="https://conkayyan.github.io/hosts-switch/"
_ghurl="https://github.com/conkayyan/hosts-switch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/conkayyan/hosts-switch/v${pkgver}/LICENSE"
)
sha256sums=('7f248e23234172103c3cfb2bdb7d7f19c539ddf40d3ea366d6b08125f3b6b335'
            '7975b734c9f7f69b3a4e593a0cf4e33649c7d50c87b52891ee0b9e7800bcf5e1')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "3i\Categories=Network;" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sparus-bin
_pkgname=Sparus
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple game launcher to start and keep your game up-to-date !(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Ludea/Sparus"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_0.2.0_amd64.deb"
)
sha256sums=('c62a947a806d641a502afb0b3695e876d58c79611c31f0287e47880b1cb751d0')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        3i\Comment=${pkgdesc}/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
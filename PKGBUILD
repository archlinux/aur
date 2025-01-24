# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fluxy-bin
_pkgname=FLUXY
pkgver=0.1.17
pkgrel=1
pkgdesc="Software for fast file transfer between terminals in the same network segment.同网段中终端间快速互传文件(Prebuilt version)"
arch=('x86_64')
url="https://github.com/alley-rs/fluxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'libsoup'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('622a4fdb644714cba4741c93cc44fbd6880b1d162b888502b3e4debdbb903301')
prepare() {
    sed -e "s/Categories=/Categories=Network;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=phoenix-auth-bin
_pkgname='Phoenix Auth'
pkgver=0.8.1
pkgrel=1
pkgdesc="A free Open Source desktop 2FA Application.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/liamh101/phoenix-auth"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('8b0feaa694300c73732ec629b8c5a430108290196c054497a2ab07f3a3221a6f')
prepare() {
    sed -i -e "
        s/Categories=/Categories=System;Utility;/g
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
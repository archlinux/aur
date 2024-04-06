# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatnio-bin
_pkgname="Chat Nio"
pkgver=3.10
pkgrel=1
pkgdesc="🚀 Next Generation AI One-Stop Internationalization Solution."
arch=("x86_64")
url="https://chatnio.net/"
_ghurl="https://github.com/Deeptrain-Community/chatnio"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.5_amd64.deb"
)
sha256sums=('4338657fce74a5bfcac3252a38058638c7327c084c627c81ae4203c8638f4d0d')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Name=${pkgname%-bin}|Name=${_pkgname}|g;s|Categories=Development;|Categories=Utility;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eagle-animation-bin
_appname="Eagle Animation"
pkgver=2.3.1
pkgrel=3
pkgdesc="An awesome, free and open-source animation software."
arch=('x86_64')
url="https://brickfilms.com/"
_ghurl="https://github.com/brick-a-brack/eagle-animation"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c394b441cd06bbe775d219a0aa7bf5c7f00e3f1abc4e810bc841e14ffb6b3b2a'
            '26806402974b2aba0d9edc83890924572dec34c0224df38ac496bc4fcfa2deac')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
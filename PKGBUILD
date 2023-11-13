# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electrocrud-bin
_appname=ElectroCRUD
pkgver=3.1.0_develop.1
pkgrel=5
pkgdesc="Database CRUD Application Built on Electron | MySQL, Postgres, SQLite"
arch=('x86_64')
url="http://garrylachman.github.io/ElectroCRUD/"
_githuburl="https://github.com/garrylachman/ElectroCRUD"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
)
source=(
    "${pkgname%-appimage}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${_appname}-v${pkgver//_/-}-linux-x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('6bd3e133f38beb97f8856254f09f28dd8f506ec127e3a3ae2020e65f046a441b'
            '5015294cc468de41bf0dbebe699ecb5befd771f6371f5d5527a62fbd7bee4703')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
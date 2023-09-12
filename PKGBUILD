# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electrocrud-bin
_appname=ElectroCRUD
pkgver=3.1.0_develop.1
pkgrel=4
pkgdesc="Database CRUD Application Built on Electron | MySQL, Postgres, SQLite"
arch=('x86_64')
url="http://garrylachman.github.io/ElectroCRUD/"
_githuburl="https://github.com/garrylachman/ElectroCRUD"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('asar')
source=("${pkgname%-appimage}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${_appname}-v${pkgver//_/-}-linux-x64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('6bd3e133f38beb97f8856254f09f28dd8f506ec127e3a3ae2020e65f046a441b'
            '87dd23b25c16bba1ac4bf294be1cf373ba3d2c74bbc01d40850714143901ff15')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
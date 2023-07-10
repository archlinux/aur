# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electrocrud-bin"
pkgver=3.1.0.develop.1
_pkgver=3.1.0-develop.1
pkgrel=1
pkgdesc="Database CRUD Application Built on Electron | MySQL, Postgres, SQLite"
arch=('x86_64')
url="http://garrylachman.github.io/ElectroCRUD/"
_githuburl="https://github.com/garrylachman/ElectroCRUD"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('electron')
makedepends=('asar')
source=("${pkgname%-appimage}-${pkgver}.deb::${_githuburl}/releases/download/v${_pkgver}/ElectroCRUD-v${_pkgver}-linux-x64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('6bd3e133f38beb97f8856254f09f28dd8f506ec127e3a3ae2020e65f046a441b'
            'b1a9d4aad1ed96631140db5bd3e8fc3bcd16237ca746ef1630894e60729647f4')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
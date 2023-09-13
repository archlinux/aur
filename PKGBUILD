# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=1.1.5
pkgrel=2
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-08-14/${_pkgname}-linux-pip-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/2023-08-14/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2d5d429e637090b9e15518e7ff23ff0c51795b28a226ce11b5d80302962946dc'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            '810406a4a6b4997de4ab6c83c53a9909feb69ac2e80654127b1414d2d2268bed')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/${_pkgname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
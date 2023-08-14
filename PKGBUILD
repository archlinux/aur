# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_appname=Final2x
pkgver=1.1.5
pkgrel=1
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=('electron25' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-08-14/${_appname}-linux-pip-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2d5d429e637090b9e15518e7ff23ff0c51795b28a226ce11b5d80302962946dc'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            '810406a4a6b4997de4ab6c83c53a9909feb69ac2e80654127b1414d2d2268bed')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/${_appname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/${_appname}/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" \
        -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="final2x-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=('electron25' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-07-20/Final2x-linux-pip-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('c32d32911bb0055ad4e5cd5832434c45f7ac933cb085ae9ee75e21b41a8c2128'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            '810406a4a6b4997de4ab6c83c53a9909feb69ac2e80654127b1414d2d2268bed')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/Final2x/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/Final2x/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
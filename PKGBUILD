# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="final2x-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=('electron' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-07-13/Final2x-linux-pip-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('7e445de9eb7d726f596b324d84e7368e80ec74d29dfc16f1f241e57769919295'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            '86a8aace38cdf6e633f0dfa93ded703e247dbad4a009726861cd7ce1f44e25a5')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/Final2x/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/Final2x/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
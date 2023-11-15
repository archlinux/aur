# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=objtoschematic-bin
_pkgname=ObjToSchematic
pkgver=0.7.1
pkgrel=8
pkgdesc="A tool to convert 3D models into Minecraft formats such as .schematic, .litematic, .schem and .nbt"
arch=('x86_64')
url="https://objtoschematic.com/"
_ghurl="https://github.com/LucasDower/ObjToSchematic"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron13'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/LucasDower/ObjToSchematic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5953facd08818a8c35a4360f220ecf72d681c37f979db85f028b5c5b8eb086c8'
            '013faf6901a4a9e6538ef3424509efb52c41dcde40070a97c6789c83c9c6de2e'
            'ed6e3981e41ce7f6d49ce6079a203d5748fefb4a3d647f30010302c85e1c9c91')
build() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${_pkgname} --no-sandbox %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/resources/app/res/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
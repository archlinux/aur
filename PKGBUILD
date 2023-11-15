# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ctool_electron
pkgname="${_pkgname//_/-}-bin"
pkgver=2.3.0
pkgrel=2
pkgdesc="Common tools for program development.程序开发常用工具 chrome/edge/firefox/utools/windows/linux/mac"
arch=('x86_64')
url="https://ctool.dev"
_ghurl="https://github.com/baiy/Ctool"
license=('MIT')
provides=("${_pkgname//_/-}")
conflicts=("${_pkgname//_/-}" "${pkgname%-bin}")
depends=(
    'electron26'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_x64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/packages/ctool-core/public/icon/icon_1024.png"
    "LICENSE::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('39943b2ce2f0232e112d14f4f39ec0008ef71d435246067692ba6dc574298337'
            '77467c477d328a27c45d59d1b808511dcff33824ca674f1aad43c606d8a1ab9c'
            '459af2e36090998e7807b1d2a5b8d6a381bf94b69cbd2ec68e7943a09e2ce1e2'
            'b4b2561cbb8513a4978d1d006d5d7ac151360381ca411de78b1a7b515abcf028')
build() {
    gendesk -q -f -n --pkgname "${_pkgname//_/-}-bin" --categories "Utility" --name "${_pkgname//_/-}" --exec "${pkgname%-bin}"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/electron_linux_x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
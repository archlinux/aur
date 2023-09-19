# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ctool
pkgname="${_pkgname}-electron-bin"
pkgver=2.3.0
pkgrel=1
pkgdesc="Common tools for program development.程序开发常用工具 chrome/edge/firefox/utools/windows/linux/mac"
arch=('x86_64')
url="https://ctool.dev"
_githuburl="https://github.com/baiy/Ctool"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_electron_linux_x64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/packages/ctool-core/public/icon/icon_1024.png"
    "LICENSE::https://raw.githubusercontent.com/baiy/Ctool/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('39943b2ce2f0232e112d14f4f39ec0008ef71d435246067692ba6dc574298337'
            '77467c477d328a27c45d59d1b808511dcff33824ca674f1aad43c606d8a1ab9c'
            '459af2e36090998e7807b1d2a5b8d6a381bf94b69cbd2ec68e7943a09e2ce1e2'
            '97cb2db4919d62105a97fcbf7770028f5d94d7dc3cb9b11203f0625970a306fc')
build() {
    gendesk -q -f -n --pkgname "${_pkgname}-electron-bin" --categories "Utility" --name "${_pkgname}" --exec "JSC_useDFGJIT=0 ${pkgname%-bin}"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/electron_linux_x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
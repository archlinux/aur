# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monarch-bin
pkgver=2.2.2
pkgrel=4
pkgdesc="a tool for building Flutter widgets in isolation. It makes it easy to build, test and debug complex UIs."
arch=('x86_64')
url="https://monarchapp.io/"
_ghurl="https://github.com/Dropsource/monarch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::https://d148mrbia1nlbw.cloudfront.net/linux/${pkgname%-bin}_linux_${pkgver}.tar.xz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Dropsource/monarch/${pkgname%-bin}-binaries-${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('04b40bd8aeb398f35c1354c500401b3b071f5f55c137aef7342c6988d15bb07d'
            '6d103cf91ac337450bdb2c10aa56dce34c723e30c3a44e3dd2acb4fdda142729'
            '3aeb276f254e749ba382de96976a0ee329ddda28670ee3328ab7255e5ddeb932')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
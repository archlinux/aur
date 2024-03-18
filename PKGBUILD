# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=benchworx-bin
pkgver=0.0.1_beta.3
_electronversion=12
pkgrel=8
pkgdesc="A DynamoDB GUI for local and remote DynamoDB tables"
arch=("x86_64")
url="https://github.com/simonireilly/dynamoDB-benchworx"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('197f8c47e3b937ae6c24be5b7c49a2cd1f38f29205c6e28af987cc3581e8e41e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
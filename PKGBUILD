# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stampnyaa-bin
pkgver=1.6.0
pkgrel=3
pkgdesc="A simple desktop app for downloading and using LINE stickers in chat apps like Discord."
arch=("x86_64")
url="https://github.com/MarvNC/StampNyaa"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
    'java-runtime'
    'libxtst'
    'libx11'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('ea6341d72dc717c8fa0fd9a41e0ea871e23852eae93cc3318144ba3417920d64'
            '8bad71d9cea6a3e51b3b9709d833fee4acdcc3907a3a9d8de519056981725c75')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
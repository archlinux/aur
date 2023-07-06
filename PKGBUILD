# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="stampnyaa-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple desktop app for downloading and using LINE stickers in chat apps like Discord."
arch=("x86_64")
url="https://github.com/MarvNC/StampNyaa"
license=('MIT')
depends=('electron')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('bda23b9a48301b62eacbc6e71f8fd314fc62fcb7b8da3158877860426b825fef'
            '5199f48d8cc17fa79a105ea6b6b1afa467845832180357de82b223eb4db124bb')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|${pkgname%-bin} %U|opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
}
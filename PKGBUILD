# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>
pkgname=prepros-bin
pkgver=7.8.5
pkgrel=2
pkgdesc="Prepros compiles your files, transpiles your JavaScript, reloads your browsers and makes it really easy to develop & test your websites so you can focus on making them perfect."
arch=('x86_64')
url="https://prepros.io"
license=('custom:proprietary')
depends=('bash' 'java-runtime' 'electron25' 'perl' 'lib32-gcc-libs' 'lib32-glibc' 'glibc' 'gcc-libs' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::https://downloads.prepros.io/v7/${pkgver}/Prepros-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('4cacf100b84428c31d6fa0e64eb36918bcc387d4358459f5790483c22f0a6fa3'
            '656c3bb05396338c36ca8d3d626f900fc0edf450f999040920e10e03a3a25c26')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|prepros %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pocket-casts-desktop-bin"
pkgver=0.6.0
pkgrel=2
pkgdesc="The Pocket Casts webapp, packaged for the Linux Desktop."
arch=('x86_64')
url="https://github.com/felicianotech/pocket-casts-desktop-app"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=('bash' 'electron21')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/felicianotech/pocket-casts-desktop-app/trunk/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9c7745f510ce90cf47c3098afdac6220f3389e62ab5a9fc51cd0bf108d6f4d37'
            '5478e5a98666c41de828fb7f50c3ea53b05755b7bda7d11211c6b1406d3046ba'
            '5e0cd82a318767772a4ac182c2d1bef8412530809a3bb6a121446e30d657b07d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-desktop-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-desktop-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-desktop-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-desktop-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-desktop-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-desktop-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
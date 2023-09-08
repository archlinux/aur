# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=protoman-bin
_pkgname=Protoman
pkgver=0.4.1
pkgrel=2
pkgdesc="A Postman-like API client for protobuf-based messages."
arch=("x86_64")
url="https://github.com/spluxx/Protoman"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron9')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/spluxx/Protoman/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('50934845993c2bcaaa3a659c907703fd9eef16dbf68f714aad512ff8b06445a3'
            'a70b7631e4233a150ba463a503958f7e76bbb44d3da40ef36b22e4cc158742d9'
            '23359ac62efbecec1270da119f4a87ea03dcde6c7229b747184d93a58e4d1a54')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qcalc-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Quasar Calculator"
arch=('x86_64')
url="https://github.com/from104/qcalc"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Q.Calc-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/from104/qcalc/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('91b0df10ca2456fdf3a4865acbc31d98bb49f82acde048c7e84ab9a267c71716'
            '3987b48fb3c79907511fb74614201dbf40f9bff0cc691d4f2dbcad754cba519b'
            '91fb24e21e74a3f1982f9f3794213b2129a8cd525be385dceee4814f642c95d1')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
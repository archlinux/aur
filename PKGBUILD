# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notes-nc-bin
_pkgname=Notes
pkgver=0.7.2
pkgrel=3
pkgdesc="Cross-platform Notes desktop application for markdown notes"
arch=('x86_64')
url="https://github.com/mscharley/notes-nc"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mscharley/notes-nc/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('0aed5df1e7d6d17064f2182545600637e788f6adf0a45c248c3cd08a8e5f6c5c'
            '3dcc1e196d70d5503a020194e91d5d663f428c349622d1f0eb545ec2f354264b'
            '81b61b6f614c7201ffede6615ea9ee73b3e3d5e91ee599e436c32e9b1f5a1253')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=panwriter-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Markdown editor with pandoc integration and paginated preview."
arch=('x86_64')
url="https://panwriter.com/"
_githuburl="https://github.com/mb21/panwriter"
license=('GPL3')
depends=('bash' 'electron22')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/PanWriter-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('ea3390a5371cdfa45d921c160b26c5cb94e6ba9f8f6e1809f3d8d569da38912e'
            'ba0a093690b1b97196cbb78e6896d8ce8a5ec0085ecf6e79408a6f7b2e55a25c')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
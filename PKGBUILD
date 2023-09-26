# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=coinstac-desktop-app-bin
_appname=COINSTAC
pkgver=6.7.7
pkgrel=1
pkgdesc="Collaborative Informatics and Neuroimaging Suite Toolkit for Anonymous Computation"
arch=('x86_64')
url="https://github.com/trendscenter/coinstac"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trendscenter/coinstac/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('d89ce6b7bb16a0cbed7d895b21efef6a59dab8ffe54b2135542e69a0042344f4'
            'fcf8a012e25e06508e76c87a9607116d8cf2a195c8e12f960ff01e64b493f882'
            '8ba850698624a1f8ac10bd7891e20c28c0e1168b288f2b4a45026c4cfd77ba8a')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar"
    install -Dm644 "${srcdir}/squashfs-root/resources/resources/fonts/Roboto-Regular.ttf" -t "${pkgdir}/opt/${pkgname%-bin}/resources/fonts"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="redisfish-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc="A convenient, cross-platform, data-focused Redis GUI client"
arch=('x86_64')
url="https://github.com/Kuari/RedisFish"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13')
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/RedisFish-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('29024ae89b860ef8832e4219ce9fda1f339621e2b13c28306e32f9edd50dfb35'
            '6499f7145224c9137a51f0b234ed640759b5a8908f0bc18532bad45e84737a21')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}.AppImage"
    "./${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
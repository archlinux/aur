# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electronim-bin
pkgver=0.0.95
pkgrel=1
pkgdesc="A Self Contained Desktop Version Of electronim Made With Electron"
arch=('x86_64')
url="https://github.com/manusa/electronim"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('69f045bdc81ce3ae484ff9c0d7bd2e2e5e06489187b74f345ede83ae55be0148'
            'be837ef65c85241d02a30b6fc7693f7b66a59963521f657335ec73212e2ee020')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
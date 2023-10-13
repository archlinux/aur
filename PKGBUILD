# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electronim-bin
pkgver=0.0.97
pkgrel=1
pkgdesc="Electron based multi IM (Instant Messaging) client"
arch=('x86_64')
url="https://github.com/manusa/electronim"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26' 'libdbusmenu-glib' 'gtk2' 'dbus-glib' 'gdk-pixbuf2' 'libxext' 'dbus' 'glibc' 'libx11' 'glib2')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1e61707419623f671f9a9347f415226bc672d1bbcd6ae61b0e5b5e7b2027919f'
            'a05800116a19eca05613da2e5c8c9b3555906d9346865bf9fad2fc3cb67868f0')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
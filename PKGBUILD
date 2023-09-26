# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=1.5
pkgrel=2
pkgdesc="A small and nimble GUI for XRay"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk2' 'fping' 'cairo' 'at-spi2-core' 'libx11' 'bash' 'glibc' 'pango' 'glib2' 'gdk-pixbuf2' 'p7zip' \
    'wget' 'zenity' 'systemd' 'gtk2' 'libproxy')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx9_amd64.deb")
sha256sums=('d66384c32e8eb017d2c327ef6ca202bbe09338ddbafb0036cf400838f9c319d5')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/etc/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm755 "${pkgdir}/opt/${pkgname%-bin}/all/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
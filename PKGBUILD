# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=1.8
pkgrel=2
pkgdesc="A small and nimble GUI for XRay"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk2'
    'fping'
    'cairo'
    'at-spi2-core'
    'libx11'
    'pango'
    'gdk-pixbuf2'
    'p7zip'
    'wget'
    'zenity'
    'systemd'
    'gtk2'
    'libproxy'
    'fping'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx9_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('5790a63bad60a2722409dfb4165f5db0dade46555e0ca6c0d4553d556bf9aa14'
            '810844dac159a0c6d46da58e10d57f1b4c958749efa8c6776515240823076074')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/etc/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
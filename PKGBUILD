# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=2.1
pkgrel=1
pkgdesc="A small and nimble GUI for XRay"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk2'
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
sha256sums=('1a5c2d3b8e3c0fe5604910eba366c00c7cb4bc8a73b5381e7e2e4cff09b3e65d'
            'b83af9da8cfc860e72f06d4e0812bd487951f799c46c1ebfc5634e29c9134260')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/etc/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/all/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
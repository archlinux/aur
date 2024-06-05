# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=2.2
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
sha256sums=('121b209d6552f848f1ee0f7f9dda1df238cf2400c1ca4f65a6f994e7f8b76f93'
            '50baeedca48fe84262e157000c2051b237ece2307da6a6e22bfc28b15881ad87')
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
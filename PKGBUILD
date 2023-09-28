# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=privaxy-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="The next generation tracker and advertisement blocker. It blocks ads and trackers by MITMing HTTP(s) traffic."
arch=("x86_64")
url="https://github.com/Barre/privaxy"
license=("AGPL3")
depends=('gdk-pixbuf2' 'glib2' 'cairo' 'hicolor-icon-theme' 'webkit2gtk' 'gcc-libs' 'glibc' 'gtk3' 'dbus')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('e431f19df78e866fdbcf2103e4558c562456f28c4b6d52c213458798788d5641')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}
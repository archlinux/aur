# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linux-assistant-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A daily linux helper with powerful integrated search, routines checks and administrative tasks. The Project is built with flutter and python."
arch=('x86_64')
url="https://www.linux-assistant.org/"
_ghurl="https://github.com/Jean28518/linux-assistant"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'python-gobject'
    'python>3'
    'libkeybinder3'
    'flatpak'
    'wmctrl'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}.deb")
sha256sums=('d76573090a5375bb8f819968d6a5cc234f10681c945d29d95326242de56d60b0')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr"
    cp -r "${srcdir}/usr" "${pkgdir}"
}
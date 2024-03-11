# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linux-assistant-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A daily linux helper with powerful integrated search, routines checks and administrative tasks. The Project is built with flutter and python."
arch=('x86_64')
url="https://www.linux-assistant.org/"
_githuburl="https://github.com/Jean28518/linux-assistant"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'python-gobject'
    'hicolor-icon-theme'
    'python>3'
    'libkeybinder3'
    'flatpak'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb")
sha256sums=('a3a3df65e05590bb0566cde5b7aa68437531143d0982f4b45ebe31aebeb2df09')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr" "${pkgdir}"
}
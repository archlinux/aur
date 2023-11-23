# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linux-assistant-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A daily linux helper with powerful integrated search, routines checks and administrative tasks. The Project is built with flutter and python."
arch=('x86_64')
url="https://www.linux-assistant.org/"
_githuburl="https://github.com/Jean28518/linux-assistant"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'at-spi2-core'
    'harfbuzz'
    'python-gobject'
    'hicolor-icon-theme'
    'python'
    'gdk-pixbuf2'
    'libkeybinder3'
    'cairo'
    'pango'
    'libepoxy'
    'gobject-introspection-runtime'
    'fontconfig'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb")
sha256sums=('a0ba636e38bd4b060f59e75882bc796a9af0c7eee1152ab454723af1ad244031')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.${pkgname%-bin}.operations.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
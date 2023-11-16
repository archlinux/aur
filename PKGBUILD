# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=line-by-line-bin
_pkgname=linebyline
pkgver=0.5.3
pkgrel=2
pkgdesc="Modern markdown editor application with built-in ChatGPT extension."
arch=("x86_64")
url="https://linebyline-group.vercel.app/"
_ghurl="https://github.com/linebyline-group/linebyline"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'gdk-pixbuf2'
    'libsoup'
    'gtk3'
    'webkit2gtk'
    'pango'
    'libxcb'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${CARCH}.deb"
)
sha256sums=('dacc938af6660cb2a33b346f9b44c39d93644e2b25022c06a9ea744db324128d')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
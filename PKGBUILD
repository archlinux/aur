# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=3.0.11
pkgrel=5
pkgdesc="An intuitive cross-platform hardware design application."
arch=('x86_64')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL3')
conflits=("${pkgname%-bin}")
depends=(
    'mesa'
    'libx11'
    'cairo'
    'gtk3'
    'libcups'
    'libxcb'
    'libxrandr'
    'libxkbcommon'
    'pango'
    'libxdamage'
    'libxcomposite'
    'at-spi2-core'
    'alsa-lib'
    'libdrm'
    'libxfixes'
    'expat'
    'nss'
    'libxext'
    'nspr'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
)
sha256sums=('da0135a811e78132b06efdb4000313d36754441f1f9c7926f48777df069653a9')
build() {
    mkdir -p "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
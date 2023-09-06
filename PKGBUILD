# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=3.0.11
pkgrel=2
pkgdesc="An intuitive cross-platform hardware design application."
arch=('x86_64')
url="https://tomcl.github.io/issie"
_githuburl="https://github.com/tomcl/issie"
license=('GPL3')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('mesa' 'libx11' 'cairo' 'gtk3' 'libcups' 'libxcb' 'libxrandr' 'libxkbcommon' 'glib2' 'pango' 'libxdamage' 'glibc' 'dbus' \
    'libxcomposite' 'at-spi2-core' 'gcc-libs' 'alsa-lib' 'libdrm' 'libxfixes' 'expat' 'nss' 'libxext' 'nspr')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip")
sha256sums=('da0135a811e78132b06efdb4000313d36754441f1f9c7926f48777df069653a9')
prepare() {
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    gendesk -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
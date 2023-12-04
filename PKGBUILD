# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
_pkgname=BlueBubbles
pkgver=1.12.7
_subver=2B61
pkgrel=1
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Android, PC (Windows, Linux, & even macOS), and Web!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libepoxy'
    'webkit2gtk-4.1'
    'at-spi2-core'
    'gdk-pixbuf2'
    'cairo'
    'mpv'
    'harfbuzz'
    'pango'
    'libdbusmenu-glib'
    'libnotify'
    'libappindicator-gtk3'
    'gtk3'
    'libsoup3'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar::${_ghurl}/releases/download/v${pkgver}%${_subver}/${pkgname%-bin}-linux-aarch64.tar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar::${_ghurl}/releases/download/v${pkgver}%${_subver}/${pkgname%-bin}-linux-x86_64.tar")
source=("${pkgname%-bin}.sh")
sha256sums=('4f890079812e5c20c11a589f3c71a11b091a77c8c836302a0563b03f7c44b7ea')
sha256sums_aarch64=('6df20701f6a7087d362f0b27e294929d259896bd2f36908053d00cf713e7a08b')
sha256sums_x86_64=('8c0c3487062cb7546b5208b85cbda6794251e046256f9c422fee1ce067ffc34c')
build() {
    gendesk -f -n -q --icon "${pkgname%-bin}" --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/lib}
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
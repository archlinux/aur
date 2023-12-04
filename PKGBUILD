# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
_pkgname=BlueBubbles
pkgver=1.12.6
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar::${_ghurl}/releases/download/v${pkgver}%2B60/${pkgname%-bin}-linux-aarch64.tar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar::${_ghurl}/releases/download/v${pkgver}%2B60/${pkgname%-bin}-linux-x86_64.tar")
sha256sums_aarch64=('374710f68ee71e131346aee9d29282fe1fd21d6f4d0c545463133ea3bce55047')
sha256sums_x86_64=('916ea47eaab1c02d7324150f0bb46479655c23b8fcf070faee38cbb75e97ad61')
build() {
    gendesk -f -n -q --icon "${pkgname%-bin}" --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin,usr/lib}
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
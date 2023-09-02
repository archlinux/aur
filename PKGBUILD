# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
_pkgname=BlueBubbles
pkgver=1.12.4
pkgrel=2
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Android, PC (Windows, Linux, & even macOS), and Web!"
arch=('aarch64' 'x86_64')
url="https://bluebubbles.app/"
_githuburl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'libepoxy' 'vlc' 'gcc-libs' 'at-spi2-core' 'gdk-pixbuf2' 'cairo' 'mpv' \
    'harfbuzz' 'glibc' 'pango' 'libdbusmenu-glib' 'libnotify' 'libappindicator-gtk3' 'gtk3')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar::${_githuburl}/releases/download/v${pkgver}%2B58/${pkgname%-bin}-linux-aarch64.tar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar::${_githuburl}/releases/download/v${pkgver}%2B58/${pkgname%-bin}-linux-x86_64.tar")
sha256sums_aarch64=('63fc7c8d87eee6086c4bda557aa0e97893c643aecf95ea41ce5a86ea30a09379')
sha256sums_x86_64=('616ab5cfd458cb3ba1a8fea163443e686173a6312d806e42a08e920adcfce97b')
prepare() {
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin,usr/lib}
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "BlueBubbles" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
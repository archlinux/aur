# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
pkgver=1.12.2
pkgrel=3
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Android, PC (Windows, Linux, & even macOS), and Web!"
arch=('aarch64' 'x86_64')
url="https://bluebubbles.app/"
_githuburl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'libepoxy' 'vlc' 'gcc-libs' 'at-spi2-core' 'gdk-pixbuf2' 'cairo' \
    'harfbuzz' 'glibc' 'pango' 'libdbusmenu-glib' 'libnotify' 'libappindicator-gtk3' 'gtk3')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar::${_githuburl}/releases/download/v${pkgver}%2B55/${pkgname%-bin}-linux-aarch64.tar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar::${_githuburl}/releases/download/v${pkgver}%2B55/${pkgname%-bin}-linux-x86_64.tar")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar")
sha256sums_aarch64=('9472215126987c8508bf8e595429d1eba1c6a9041e2eded6ae24736070036e36')
sha256sums_x86_64=('4ac735a698fca2cfab0461e466a9ca33e3c722e77a5ee31b6cef9bc2d0db5909')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "BlueBubbles" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
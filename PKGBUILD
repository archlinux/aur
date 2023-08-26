# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
pkgver=1.3.10
pkgrel=1
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'glibc' 'cairo' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'gcc-libs' 'libepoxy' \
    'glib2' 'libayatana-appindicator' 'libdbusmenu-glib' 'libayatana-indicator' 'ayatana-ido')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('f8f312c5124b8af208082730bf21797f30a504b46afd1482eadf94541341e4d1')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|Utility|Network;Utility|g;s|/usr/local/lib/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|/usr/share/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/local/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
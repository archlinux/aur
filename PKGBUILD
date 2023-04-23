# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gopeed-bin"
pkgver=1.3.0
pkgrel=2
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
options=()
providers=(GopeedLab)
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'glibc' 'cairo' 'hicolor-icon-theme' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'gcc-libs' 'libepoxy' 'glib2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('cb521abb6c89330626f919c33a12b0f067400ec3826a069189a03835cd2dfb46')

package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}" --uname root --gname root
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/local/lib/${pkgname%-bin}" "${pkgdir}/opt"    
    sed 's|Utility|Network;Utility|g;s|/usr/local/lib/gopeed/gopeed|/opt/gopeed/gopeed|g;s|/usr/share/icons/gopeed.png|gopeed|g' \
        -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    rm -rf "${pkgdir}/usr/local" "${pkgdir}/usr/share/icons/${pkgname%-bin}.png"
}
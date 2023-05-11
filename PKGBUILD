# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gopeed-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'glibc' 'cairo' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'gcc-libs' 'libepoxy' 'glib2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('ad5d26f04b4af723f771b0860e7648ad68ead3f38d32cd7ec71f61f43e896f20')

package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}" --uname root --gname root
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/local/lib/${pkgname%-bin}" "${pkgdir}/opt"    
    sed 's|Utility|Network;Utility|g;s|/usr/local/lib/gopeed/gopeed|/opt/gopeed/gopeed|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    echo -e "\nIcon=${pkgname%-bin}" >> "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    rm -rf "${pkgdir}/usr/local" "${pkgdir}/usr/share/icons"
}
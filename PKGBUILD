# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gopeed-bin"
pkgver=1.3.5
pkgrel=1
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'glibc' 'cairo' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'gcc-libs' 'libepoxy' 'glib2' 'libayatana-appindicator' 'libdbusmenu-glib' 'libayatana-indicator' 'ayatana-ido')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('4768abd3a20dae693b8dfc44f39194ba919e9cf2a557f1a98d7da471b8a452c5')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --uname root --gname root
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/local/lib/${pkgname%-bin}" "${pkgdir}/opt"    
    sed "s|Utility|Network;Utility|g;s|/usr/local/lib/${pkgname%-bin}/${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g" \
        -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    echo -e "\nIcon=${pkgname%-bin}" >> "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    rm -rf "${pkgdir}/usr/share/icons" "${pkgdir}/usr/local"
}
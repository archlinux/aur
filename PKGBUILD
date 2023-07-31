# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
pkgver=1.3.8
pkgrel=1
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'glibc' 'cairo' 'gdk-pixbuf2' 'harfbuzz' 'pango' 'gcc-libs' 'libepoxy' 'glib2' 'libayatana-appindicator' 'libdbusmenu-glib' 'libayatana-indicator' 'ayatana-ido')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('0d710c25178bbca440f2195b960130e8ab1363d80281bf718dcc244079965598')
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
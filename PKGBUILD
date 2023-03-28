# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=gopeed
pkgname="${_pkgname}-bin"
pkgver=1.2.3
pkgrel=4
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
options=()
providers=(GopeedLab)
conflicts=("${_pkgname}")
depends=(at-spi2-core gtk3 glibc cairo hicolor-icon-theme gdk-pixbuf2 harfbuzz pango gcc-libs libepoxy glib2)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha256sums=('88d13aee095941160097a763f6f1b0d2b5fa18e0edeb3ccfb9867db4f1ffebcb')

package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}" --uname root --gname root
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/local/lib/${_pkgname}" "${pkgdir}/opt"    
    rm -rf "${pkgdir}/usr/local"
    sed 's/Utility/Network;Utility;/g;s/\/usr\/local\/lib\/gopeed\/gopeed/\/opt\/gopeed\/gopeed/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "\nIcon=${_pkgname}" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    rm -rf "${pkgdir}/usr/share/icons/${_pkgname}.png"
}
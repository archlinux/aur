# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

_pkgbinname=netpanzer
pkgname=netpanzer-appimage
_pkgformalname=NetPanzer
pkgver=0.8.7
pkgrel=2
pkgdesc="An online multiplayer tactical warfare game designed for fast action combat (AppImage)"
url="https://github.com/netpanzer/netpanzer"
license=('GPL2')
arch=('x86_64')
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
options=('!strip')
source_x86_64=("https://github.com/${_pkgbinname}/${_pkgbinname}/releases/download/${pkgver}-github/${_pkgformalname}-${pkgver}-${arch}-${pkgrel}.AppImage")
sha256sums_x86_64=('541bc2e4e84104259a0c0b0ec1181e57e6866ebffdeef79593fc13a2a2ca084d')
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgformalname}-${pkgver}-${arch}-${pkgrel}.AppImage
    "./${_pkgformalname}-${pkgver}-${arch}-${pkgrel}.AppImage" --appimage-extract > /dev/null
}

package() {
    install -Dm755 "${srcdir}"/${_pkgformalname}-${pkgver}-${arch}-${pkgrel}.AppImage "${pkgdir}"/${_install_path}/${_pkgformalname}-${pkgver}-${arch}-${pkgrel}.AppImage

    install -Dm0644 "${srcdir}/squashfs-root/${_pkgbinname}.png" \
      -t  "${pkgdir}/usr/share/icons/hicolor/48x48/apps"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgbinname}.desktop" -t "${pkgdir}/usr/share/applications"
}

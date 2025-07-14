# Maintainer: nilrem <nilremdev@gmail.com>

_pkgname=highlite
pkgname=${_pkgname}-appimage
pkgver=1.4.1
pkgrel=1
pkgdesc='Open-source game client for High Spell'
arch=('x86_64') # TODO: check if other architectures work
license=('GPLv3')
url='https://github.com/Highl1te/HighliteDesktop'
_appimage="HighLite-${pkgver}.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/HighLite-${pkgver}.AppImage" highlite.desktop)
sha256sums=('b5c605061462db06abc4bf19c871c50154a1f57734fa6df50e7beaa4b3bcd021'
            'cc333c4e700dd66d6c409599f1f8861d9dea8c318947bda95b1d4bc4b8c05bc0')
options+=(!strip) # Necessary for packages with AppImage sources

prepare() {
    # Remove old extracted appimage to prevent extract error
    # This comment and precaution taken from the runelite-launcher-appimage package
    rm -rf squashfs-root
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

package() {
    install -Dm644 \
        "${srcdir}/highlite.desktop" \
        "${pkgdir}/usr/share/applications/highlite.desktop"

    install -Dm644 \
        "${srcdir}/squashfs-root/highlite.png" \
        "${pkgdir}/usr/share/pixmaps/highlite.png"

    install -Dm755 \
        "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/highlite"
}

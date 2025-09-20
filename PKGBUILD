# Maintainer: nilrem <nilremdev@gmail.com>

_pkgname=highlite
pkgname=${_pkgname}-appimage
pkgver=3.0.0
pkgrel=1
pkgdesc='Open-source game client for High Spell'
arch=('x86_64') # TODO: check if other architectures work
license=('GPLv3')
url='https://github.com/Highl1te/HighliteDesktop'
_appimage="HighLite-${pkgver}.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/HighLite-${pkgver}.AppImage" highlite.desktop)
sha256sums=('66a333cd7bb7192778f91fae50bdbd513e784f93e9cd535d83fe27e5868373eb'
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
        "${srcdir}/squashfs-root/HighLite.png" \
        "${pkgdir}/usr/share/pixmaps/highlite.png"

    install -Dm755 \
        "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/highlite"
}

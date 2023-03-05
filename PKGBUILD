# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notable-appimage
_pkgname=notable
pkgver=1.8.4
pkgrel=2
epoch=
pkgdesc="The Markdown-based note-taking app that doesn't suck."
arch=("x86_64")
url="https://notable.app/"
_githuburl="https://github.com/notable/notable"
license=('unknown')
depends=('hicolor-icon-theme' 'zlib')
options=(!strip)
optdepends=()
provides=()
conflicts=('notable-bin' 'notable-insiders-bin' 'notable-insiders-electron')
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Notable-${pkgver}.AppImage")
sha256sums=('7ee59f198613f35e8cdb21b73dc100cb1798201716ed9b108e5398a8f9477f67')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/notable.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}

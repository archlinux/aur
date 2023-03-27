# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=diffuse
pkgname="${_pkgname}-player-appimage"
pkgver=3.3.0
pkgrel=2
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(custom)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=(icidasset)
conflicts=("${_pkgname}-player")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-linux-amd64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('2daf98d617d871968a33b0f8f78b40247de4c20dc612e8d507af96a314cdb988'
            '0a21c689228ea59b37ff87f23146184df79a56822674db6b2be9e976748d3833')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=diffuse/Exec=\/opt\/appimages\/diffuse.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
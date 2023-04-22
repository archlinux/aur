# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-onenote-appimage"
pkgver=2023.4.117
pkgrel=3
epoch=
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
optdepends=()
provides=(patrikx3)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/P3X-OneNote-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('86bfe63ceae588ff037a3dc3544dbec1891bd49efcf560a4918df17bd11c338e'
            'eace4c6ceff7c3e609153ca94c61861aab5ad6ab83cf179ee289a27d5ffcbd9b')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/p3x-onenote.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
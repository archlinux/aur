# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=moosync
pkgname="${_pkgname}-appimage"
pkgver=8.0.0
pkgrel=1
pkgdesc="Music player capable of playing local audio or from Youtube, Spotify and many more"
arch=("x86_64")
url="https://moosync.app/"
_githuburl="https://github.com/Moosync/Moosync"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('1cc699288ca44d7fb6bddb9ef667d13b9b4b7b3ce295834b3f4149e1c05b0126')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/moosync.AppImage/g;s/Utility/Utility;AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}

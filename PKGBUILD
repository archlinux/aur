# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flb-music-player-appimage
_pkgname=flbmusic
pkgver=1.2.1
pkgrel=2
pkgdesc="A beautiful Feature Rich Music Player and Downloader,cross platform"
arch=('x86_64')
url="https://flbmusic.xyz/"
_githuburl="https://github.com/FLB-Music/FLB-Music-Player"
license=('GPL3')
conflicts=()
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages/"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/FLB-Music-${pkgver}.AppImage")
sha512sums=('a81cb8dc37a661f465b0add064f9d5ebc4dd9b0baa18bdf685c6dc2374fe821e188b90b7509d6a96a7fe181aa10a2b72ee13f4d6f1d06312b404d815f328e684')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

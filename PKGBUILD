# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=netpad
pkgname="${_pkgname}-appimage"
pkgver=0.1.1
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=(MIT)
options=(!strip)
providers=(tareqimbasher)
conflits=("${_pkgname}")
_install_path="/opt/appimages" 
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/netpad-${pkgver}-x86_64.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('3830437465a56059cf5c7aefa8801d5d9e880e15531fcb0d4e73f5380a011359'
            'bf644b3a7e5dc5d7c4ce8b9db8c8df97d41efa3c1bff8e4c7dfe78e668561341')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/netpad.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
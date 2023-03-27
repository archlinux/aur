# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=p3x-redis-ui
pkgname="${_pkgname}-appimage"
pkgver=2022.10.105
pkgrel=2
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=('x86_64')
url="https://www.corifeus.com/redis-ui"
_githuburl="https://github.com/patrikx3/redis-ui"
license=(MIT)
options=(!strip)
conflicts=("${_pkgname}")
providers=(patrikx3)
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/P3X-Redis-UI-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('f319cce94d28969291ac5115ca5dc1fe1b01363cda67839e7e26222ca156d507'
            'e6d817ec803c1f81999c72a6fdaf2d7fb0873e4d05320ae6156f52c25ada1c21')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/p3x-redis-ui.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

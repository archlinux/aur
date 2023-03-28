# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=boostchanger
pkgname="${_pkgname}-appimage"
pkgver=5.0.2
pkgrel=2
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=(MIT)
options=(!strip)
providers=(nbebaw)
conflits=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('d252a46b2080546e5d372d44921a839b3d00485c63fed6c9c65121dd68738a61'
            '297c0933a1a353556fd9c7a7898209c1b25a8fa8c96d3268278f77c0498b5a04')
_install_path="/opt/appimages"

prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/boostchanger.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
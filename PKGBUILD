# Contributor: Yjun <jerrysteve@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=moonfm
pkgname="${_pkgname}-appimage"
pkgver=4.0.25
pkgrel=1
pkgdesc="A modern, fully featured audio podcast player in a simple, intuitive interface."
arch=('x86_64')
url='https://moon.fm'
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::${url}/download/linux/MoonFM.AppImage")
sha256sums=('7254337eb7c9447c2de726fdc76ade0471955a46f23331f47b9062a5f6f30e50')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/moonfm.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
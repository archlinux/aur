# Maintainer: TimeTrap <zhaoyuanpan at gmail dot com>
pkgname=cursor-bin
_pkgname=Cursor
pkgver=0.1.7
pkgrel=1
pkgdesc="Write, edit, and chat about your code with GPT-4.(AppImage)"
arch=('x86_64')
url="https://cursor.so"
license=('custom')
options=('!strip')
depends=('hicolor-icon-theme' 'zlib')
source=("${_pkgname}-${pkgver}.AppImage::https://dl.todesktop.com/230313mzl4w4u92/linux/appImage/x64")
sha256sums=('bf739294bbac9d9c906455424a013cce3a178adc18380d64f58d401f0e364541')
_install_path="/opt/appimages"

prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/Cursor.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

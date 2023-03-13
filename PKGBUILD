# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-appimage
_pkgname=frappe-books
pkgver=0.10.0
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
options=(!strip)
conflicts=()
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Frappe-Books-${pkgver}.AppImage")
sha512sums=('9e50871411e7161c5b5d22aa8e6aaa2c9df1045395d1166b567b7c9e2bef7ce5953318aa5fda742c42179159d53dab197312057e278d88eacdd67641decffac3')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/frappe-books.AppImage/g;s/Finance/Utility/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

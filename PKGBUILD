# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cutter-appimage
_pkgname=cutter
pkgver=2.2.0
pkgrel=1
pkgdesc="Free and Open Source Reverse Engineering Platform powered by rizin"
arch=('x86_64')
url="https://cutter.re/"
_githuburl="https://github.com/rizinorg/cutter"
license=('GPL3')
options=(!strip)
conflicts=()
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Cutter-v${pkgver}-Linux-x86_64.AppImage")
sha512sums=('9c8f69a7f118d41d292a99c33dbd9d26eb89bed5a5cf470becbef1d32ad404c03d237ec757377f3d5bca2fd237d2474a511289b0faaf91e057a875ce82599d43')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/re.rizin.${_pkgname}.desktop"
    echo "Exec=/opt/appimages/cutter.AppImage" >> "${srcdir}/squashfs-root/re.rizin.${_pkgname}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/re.rizin.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

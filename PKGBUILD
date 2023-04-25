# Contributor: motte <ettom22 at hotmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slic3r-appimage
_appname=Slic3r
pkgver=1.3.0
pkgrel=2
pkgdesc="Open Source toolpath generator for 3D printers"
arch=('x86_64')
url="https://slic3r.org/"
_githuburl="https://github.com/slic3r/Slic3r"
license=('AGPL3')
provides=()
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}-x86_64.AppImage")
sha256sums=('bcfe883b95e4c771f5e9db64504f4732cd1106d3cf3e41585ad4d1cfe54e2377')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/slic3r.AppImage|g;s|Icon=Slic3r|Icon=slic3r|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_icons}/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}
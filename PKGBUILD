# Contributor: Yjun <jerrysteve@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="moonfm-appimage"
pkgver=4.0.25
pkgrel=1
pkgdesc="A modern, fully featured audio podcast player in a simple, intuitive interface."
arch=('x86_64')
url='https://moon.fm'
license=('custom')
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/download/linux/MoonFM.AppImage")
sha256sums=('7254337eb7c9447c2de726fdc76ade0471955a46f23331f47b9062a5f6f30e50')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/moonfm.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
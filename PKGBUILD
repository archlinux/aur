# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="boostchanger-appimage"
pkgver=5.0.2
pkgrel=3
pkgdesc="With this app you can control CPU turbo boost and the settings of the cpu speed in order to consuming less battery voltage on Linux"
arch=('x86_64')
url="https://github.com/nbebaw/boostchanger"
license=('MIT')
options=(!strip)
providers=(nbebaw)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('d252a46b2080546e5d372d44921a839b3d00485c63fed6c9c65121dd68738a61'
            'af8aec94b8f5c88f4c4e4435570b94d143970c621048db7e25f27403fa4ec02e')
_install_path="/opt/appimages"

prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/boostchanger.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
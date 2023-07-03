# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tagspaces-appimage
pkgver=5.4.1
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org/"
_githuburl="https://github.com/tagspaces/tagspaces"
license=('AGPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=('!strip')
conflicts=("${pkgname%-appimage}")
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-x86_64-${pkgver}.AppImage")
sha256sums=('283d85456da6a611b784997c44f1bfb51fd2245365c316c3c29fb1b5785c56c8')

prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
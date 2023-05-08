# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tagspaces-appimage
pkgver=5.3.4
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org/"
_githuburl="https://github.com/tagspaces/tagspaces"
license=('AGPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=(!strip)
conflicts=("${pkgname%-appimage}")
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-x86_64-${pkgver}.AppImage")
sha256sums=('13317ecf7b102551b0562826950ce7f4189d4b74990b61bd4d4632a2721cc209')

prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/pomotroid.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
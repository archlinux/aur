# Contributor: Christian Pinedo <me (at) christianpinedo (dot) eu>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=solarwallet-appimage
pkgver=0.28.1
pkgrel=1
pkgdesc="Stellar wallet. Secure and user-friendly."
arch=('x86_64')
url="https://solarwallet.io/"
_githuburl="https://github.com/satoshipay/solar"
license=('MIT')
provides=()
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}" "solar-wallet")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Solar-Wallet-${pkgver}.AppImage"
	"LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('2ce7190773f70f9ebc3091c81d84ed420abf471230f1bffc4a7af1aeed521d23'
            '122419a299dfabb6da3af79d00ffafba42ae185fa757be14cd5140f35c8ce094') 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/solarwallet.AppImage|g;s|io.solarwallet.app|solarwallet|g' -i "${srcdir}/squashfs-root/io.${pkgname%-appimage}.app.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/io.${pkgname%-appimage}.app.png" \
		-t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/io.${pkgname%-appimage}.app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
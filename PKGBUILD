# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onekey-wallet-appimage
pkgver=4.10.0
pkgrel=1
pkgdesc="Secure, open source and community driven crypto wallet runs on all platforms and trusted by millions."
arch=('x86_64')
url="https://onekey.so/"
_githuburl="https://github.com/OneKeyHQ/app-monorepo"
license=('Apache')
options=(!strip)
provides=("${pkgname%-appimage}-${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/OneKey-Wallet-${pkgver}-linux-x86_64.AppImage")
sha256sums=('6db9e47232af915517046e498c02f7d124c2b3c7a565a150b2b082f18513aa9a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/pixmaps"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
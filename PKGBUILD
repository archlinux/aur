# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nexus-wallet-appimage
_appname=nexus_wallet
pkgver=3.1.0
pkgrel=3
pkgdesc="The official Logical and Interface layers of the Nexus Software Stack."
arch=('x86_64')
url="https://crypto.nexus.io/wallet"
_githuburl="https://github.com/Nexusoft/NexusInterface"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-Linux-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Nexusoft/NexusInterface/master/LICENSE")
sha256sums=('05069e89be8316217c7414316da8367057092f287aa44a2d0e5ba9dbea3d5011'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    1install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
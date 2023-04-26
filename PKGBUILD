# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="beam-wallet-appimage"
pkgver=7.3.14027.5732
pkgrel=1
pkgdesc="Beam Desktop Wallet"
arch=('x86_64')
url="https://beam.mw/"
_githuburl="https://github.com/BeamMW/beam-ui"
license=('Apache')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.zip::${_githuburl}/releases/download/beam-${pkgver}/Beam-Wallet-${pkgver}.zip")
sha256sums=('ec1fac7fba8ce6e6597d01515a252f84823b6b1c06252550d04186b59d499c9a')
    
prepare() {
    chmod a+x "Beam-Wallet-${pkgver}.AppImage"
    "./Beam-Wallet-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|/usr/bin/BeamWallet|/opt/appimages/beam-wallet.AppImage|g;s|Icon=beam|Icon=beam-wallet|g' -i "${srcdir}/squashfs-root/BeamWallet.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/Beam-Wallet-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/BeamWallet.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}
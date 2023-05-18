# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sheikah-witnet-wallet-appimage"
pkgver=1.11.7
pkgrel=1
pkgdesc="A Witnet compatible desktop wallet and smart contracts development environment"
arch=('x86_64')
url="https://witnet.io/"
_githuburl="https://github.com/witnet/sheikah"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Sheikah-Witnet-wallet-${pkgver}.AppImage")
sha256sums=('872b2d6eea402ad47e4e632ea3fcae589cead3ef4fbb41bde4cae0739eb8cf5f')
     
prepare() {
    chmod a+x "sheikah-witnet-wallet-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/sheikah-witnet-wallet.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/sheikah-witnet-wallet-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
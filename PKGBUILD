# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=whirlpool-gui-appimage
pkgver=0.9.1
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet"
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Samourai-Wallet/whirlpool-gui/releases/download/${pkgver}/whirlpool-gui.${pkgver}.AppImage"
               "https://raw.githubusercontent.com/Samourai-Wallet/whirlpool-gui/${pkgver}/LICENSE"
              )
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('d0f7766b113793cac39edb7c629fb92f91be70e824c8fe534a1a2040586f8eec'
                   '60d2c28d19d2bdf7bbaa59829e7a595234265e8111a01ccb74d25d6c4d2d013a')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-appimage
pkgver=0.5.2_beta
# Actual version used by project
_ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/LN-Zap/zap-desktop/releases/download/v${_ver}/Zap-linux-x86_64-v${_ver}.AppImage"
               "https://raw.githubusercontent.com/LN-Zap/zap-desktop/v0.5.2-beta/LICENSE"
              )
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('431ce50ddfe422b6d4ddc608855642c0cc361d9c30ae926b7159e01c33fc05be'
                   'c7779cd186930fa9bd4d900b2243b3302f01cd593ac19098bbeb123c8ebf9d72')

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

# Maintainer: Jeremy Borgman <borgman.jeremy@pm.me>

pkgname=knock
pkgver=1.1.0
pkgrel=1
pkgdesc="Converts ACSM to epub or pdf."
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPL')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/BentonEdmondson/${pkgname}/releases/download/${pkgver}-alpha/${pkgname}-${pkgver}-alpha-x86_64-linux"
               "LICENSE::https://raw.githubusercontent.com/BentonEdmondson/${pkgname}/${pkgver}-alpha/license"
              )
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('c33d06a9d9ebc7d39cf5c229f529b460e089a41a141ec1f611ca7a995251336b'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

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

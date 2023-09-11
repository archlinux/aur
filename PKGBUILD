# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=captfencoder-bin
_pkgname=CaptfEncoder
pkgver=3.1.2
pkgrel=3
pkgdesc="A rapid cross platform network security tool suite, providing network security related code conversion, classical cryptography, cryptography, asymmetric encryption, miscellaneous tools, and aggregating all kinds of online tools."
arch=(x86_64)
url="https://github.com/guyoung/CaptfEncoder"
license=('unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glu' 'libxcb' 'libglvnd' 'gmp' 'openssl-1.1' 'glibc' 'libxcursor' 'libx11' 'gcc-libs' 'libxft' 'libxrender' 'libxfixes' 'libxinerama' 'pango')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.bin::${url}/releases/download/${pkgver}/${_pkgname}-ubuntu-20-x64-${pkgver}.bin"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/guyoung/CaptfEncoder/${pkgver}/images/captfencoder-log-1.png")
sha256sums=('dfed9cbb934bae883f5ae2e6b1d71908a6a8238d7bfdf7b243d9d2c272a30462'
            '3c0c7b76c0bd5964f77f48d9a44ccc00b59784c14fcd2ce511c6129e71c324a8')
prepare() {
    gendesk -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}.bin" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}-${pkgver}.bin" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
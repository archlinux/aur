# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=captfencoder-bin
_pkgname=CaptfEncoder
pkgver=3.1.2
pkgrel=4
pkgdesc="A rapid cross platform network security tool suite, providing network security related code conversion, classical cryptography, cryptography, asymmetric encryption, miscellaneous tools, and aggregating all kinds of online tools."
arch=("aarch64" "x86_64")
url="https://github.com/guyoung/CaptfEncoder"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glu' 'libxcb' 'libglvnd' 'gmp' 'openssl-1.1' 'glibc' 'libxcursor' 'libx11' 'gcc-libs' 'libxft' 'libxrender' 'libxfixes' 'libxinerama' 'pango')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.bin::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-linux-gnu-${pkgver}.bin")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.bin::${url}/releases/download/${pkgver}/${_pkgname}-ubuntu-20-x64-${pkgver}.bin")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/guyoung/CaptfEncoder/${pkgver}/images/captfencoder-log-1.png"
    "LICENSE::https://raw.githubusercontent.com/guyoung/CaptfEncoder/master/LICENSE")
sha256sums=('3c0c7b76c0bd5964f77f48d9a44ccc00b59784c14fcd2ce511c6129e71c324a8'
            '6eaf5f24b6c27324c0e1c433b511425d93a4c0f67de1749758188511b50eefa0')
sha256sums_aarch64=('69f2c17bbe751978a5aa740bd02dfecfd3e16c36f629d86e56a79581149beef3')
sha256sums_x86_64=('dfed9cbb934bae883f5ae2e6b1d71908a6a8238d7bfdf7b243d9d2c272a30462')
build() {
    gendesk -f -n -q --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.bin" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
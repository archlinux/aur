# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=captfencoder-bin
_pkgname=CaptfEncoder
pkgver=3.1.2
pkgrel=5
pkgdesc="A rapid cross platform network security tool suite."
arch=("aarch64" "x86_64")
url="https://github.com/guyoung/CaptfEncoder"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glu'
    'libxcb'
    'libglvnd'
    'gmp'
    'openssl-1.1'
    'libxcursor'
    'libx11'
    'libxft'
    'libxrender'
    'libxfixes'
    'libxinerama'
    'pango'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.bin::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-linux-gnu-${pkgver}.bin")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.bin::${url}/releases/download/${pkgver}/${_pkgname}-ubuntu-20-x64-${pkgver}.bin")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/guyoung/CaptfEncoder/${pkgver}/images/${pkgname%-bin}-log-1.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/guyoung/CaptfEncoder/master/LICENSE"
)
sha256sums=('3c0c7b76c0bd5964f77f48d9a44ccc00b59784c14fcd2ce511c6129e71c324a8'
            '6eaf5f24b6c27324c0e1c433b511425d93a4c0f67de1749758188511b50eefa0')
sha256sums_aarch64=('69f2c17bbe751978a5aa740bd02dfecfd3e16c36f629d86e56a79581149beef3')
sha256sums_x86_64=('dfed9cbb934bae883f5ae2e6b1d71908a6a8238d7bfdf7b243d9d2c272a30462')
build() {
    gendesk -f -n -q --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.bin" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
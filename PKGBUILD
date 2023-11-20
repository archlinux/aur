# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=1.1.5
pkgrel=5
pkgdesc="2^x Image Super-Resolution"
arch=('x86_64')
license=('BSD')
conflicts=("${pkgname%-bin}")
url="https://github.com/Tohrusky/Final2x"
depends=(
    'electron25'
    'libx11'
    'util-linux-libs'
    'xz'
    'bzip2'
    'libxcb'
    'readline'
    'vulkan-icd-loader'
    'libxext'
    'libglvnd'
    'libice'
    'libbsd'
    'libsm'
    'openssl-1.1'
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/2023-08-14/${_pkgname}-ubuntu-x64-deb.deb"
    "LICENSE::https://raw.githubusercontent.com/Tohrusky/Final2x/2023-08-14/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3640dd43368e03cbf36f208a2951056c10e5b9bc332e53d9d911d4486afff17e'
            '7b4e93ff707625a2632519b35d5891035356f551f18dd18539ad94c72f59286a'
            'c94f9e0867bb337ee36d678998c7ecc81d8fd07f602c1a7bd1cc62bf13f6f2af')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
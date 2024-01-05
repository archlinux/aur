# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nft-viewer-bin
_pkgname=nft_viewer
_appname="Bitshares NFT Viewer"
pkgver=1.9.2
pkgrel=4
pkgdesc="An NFT viewer for the Bitshares blockchain network"
arch=('x86_64')
url="https://github.com/BTS-CM/NFT_Viewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'libxrandr'
    'libxcomposite'
    'expat'
    'libxkbcommon'
    'mesa'
    'at-spi2-core'
    'libx11'
    'gtk3'
    'libxcb'
    'libcups'
    'pango'
    'nspr'
    'nss'
    'libxdamage'
    'libdrm'
    'libxfixes'
    'libxext'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BTS-CM/NFT_Viewer/v${pkgver}/LICENSE"
)
sha256sums=('3f0317a8caded555eddeed393a4f3c27f94ca504226c21a448b9cfd6d2ecb255'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
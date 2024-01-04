# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nft_tool
pkgname="${_pkgname//_/-}-bin"
_appname="Bitshares NFT issuance tool"
pkgver=1.7.2
pkgrel=5
pkgdesc="A tool for creating and editing NFTs on the Bitshares blockchain"
arch=('x86_64')
url="https://github.com/BTS-CM/Bitshares_NFT_Issuance_Tool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxdamage'
    'libxrandr'
    'nss'
    'alsa-lib'
    'libxcomposite'
    'libxfixes'
    'gtk3'
    'at-spi2-core'
    'cairo'
    'libxcb'
    'expat'
    'libxext'
    'libx11'
    'nspr'
    'libxkbcommon'
    'libcups'
    'libdrm'
    'mesa'
    'dbus'
    'pango'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BTS-CM/Bitshares_NFT_Issuance_Tool/v${pkgver}/License.md"
)
sha256sums=('87323c333009c7c19b9e904342f180ec9cc66f1d26ac6776fff5806a6193af68'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin} --no-sandbox|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
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
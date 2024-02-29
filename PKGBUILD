# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_pkgname=Monokle
pkgver=2.4.5
_electronversion=27
pkgrel=2
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=(
    'aarch64'
    'x86_64'
)
url="https://monokle.io/"
_ghurl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'nspr'
    'nss'
    'python>=3'
    'nodejs'
)
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kubeshop/monokle/v${pkgver}/LICENSE"
)
sha256sums=('7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
sha256sums_aarch64=('e34b9adc29d7314c1c47b938763d75c893a85f38d6e6bebd754039a77600fbc4')
sha256sums_x86_64=('5d5068cf1d6fc51e0557c5219d61d13f8022f03ac16a65bdc8a5a96aef26aff5')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin} --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
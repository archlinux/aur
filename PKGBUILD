# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_pkgname=Monokle
pkgver=2.4.3
_electronversion=27
pkgrel=5
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
    'at-spi2-core'
    'alsa-lib'
    'expat'
    'libxcomposite'
    'libdrm'
    'libxkbcommon'
    'libxfixes'
    'libxdamage'
    'gtk3'
    'nspr'
    'mesa'
    'libxrandr'
    'cairo'
    'nss'
    'dbus'
    'libxext'
    'python>=3'
    'libx11'
    'pango'
    'libcups'
    'libxcb'
)
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kubeshop/monokle/v${pkgver}/LICENSE"
)
sha256sums=('7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
sha256sums_aarch64=('78e8d28406b5f964f7b34af2947d9570bc6106515bdb460c66278711ff2b234f')
sha256sums_x86_64=('d11e65f53c25646ca98d13199e490eb203fcc0bbb287153a5484c307457e422f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
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
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lemmy-modder-app-bin
_pkgname="Lemmy Modder"
pkgver=0.4.0
pkgrel=2
pkgdesc="A Lemmy moderation tool for community moderators and site admins, but on steroids."
arch=("x86_64")
url="https://github.com/tgxn/lemmy-modder"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'libxkbcommon'
    'nss'
    'libxext'
    'libx11'
    'libxcomposite'
    'nspr'
    'pango'
    'libxdamage'
    'libdrm'
    'libxrandr'
    'at-spi2-core'
    'expat'
    'mesa'
    'libxcb'
    'cairo'
    'libcups'
    'libxfixes'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /}-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tgxn/lemmy-modder/v${pkgver}/LICENSE"
)
sha256sums=('14a0d44f25b697e85095c8d4edd1d054182e0cff47214b886b0a37891c4947d9'
            'cd61b504273b9fe1901027491f0a1d6164fe20053ebe74838ba7783760424759')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
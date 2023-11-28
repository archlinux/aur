# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluestone-bin
_pkgname=Bluestone
pkgver=0.12.0
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1943time/bluestone"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'alsa-lib'
    'libxcomposite'
    'cairo'
    'nss'
    'pango'
    'libxcb'
    'mesa'
    'libdrm'
    'libxkbcommon'
    'nspr'
    'gtk3'
    'expat'
    'at-spi2-core'
    'libxrandr'
    'libxdamage'
    'libcups'
    'libx11'
    'libxfixes'
    'libxext'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")
sha256sums_aarch64=('05e3336e49b0d020ba33ddef692ad5746e32b21c1a51c5235157d33e68ce756d')
sha256sums_x86_64=('575f03648dc5138e4b070f43c3e3ca7a9647c6a19c1cf480487c61cd45746b50')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin} --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Markdown|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r  "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hugin-messenger-bin
_pkgname="Hugin Messenger"
pkgver=0.4.0
pkgrel=1
pkgdesc="The new version of the private messaging desktop application powered by the Kryptokrona Blockchain."
arch=('x86_64')
url="https://hugin.chat/"
_ghurl="https://github.com/kryptokrona/hugin-desktop"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libcups'
    'libxfixes'
    'at-spi2-core'
    'libxrandr'
    'alsa-lib'
    'libxdamage'
    'libxkbcommon'
    'gtk3'
    'libxcomposite'
    'expat'
    'pango'
    'libxcb'
    'cairo'
    'mesa'
    'nss'
    'libdrm'
    'libxext'
    'libx11'
    'nspr'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('a2a850d7ef29021066d82cee855cbb8f959dcff5e4b0bcf50423c36d45139e12')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-snadbox|g;s|Utility|Network|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
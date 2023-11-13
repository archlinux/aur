# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deckboard-bin
_pkgname=Deckboard
pkgver=2.1.4
pkgrel=3
pkgdesc="Control your PC with your phone in easy way possible."
arch=(
    'i686'
    'x86_64'
)
url="https://deckboard.app/"
_ghurl="https://github.com/rivafarabi/deckboard"
license=('custom')
conflits=("${pkgname%-bin}")
depends=(
    'libxss'
    'libxfixes'
    'nspr'
    'libglvnd'
    'dbus'
    'alsa-lib'
    'gdk-pixbuf2'
    'expat'
    'util-linux-libs'
    'libxdamage'
    'libxrandr'
    'libx11'
    'libcups'
    'libxext'
    'libxi'
    'cairo'
    'libxcursor'
    'libxcb'
    'gtk3'
    'libxcomposite'
    'pango'
    'nss'
    'at-spi2-core'
    'libxrender'
    'libxtst'
    'hicolor-icon-theme'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_i686=('ea948e3972eff67d346405814195e1351fefd2ccc6b4feb0175fc6faad06bda7')
sha256sums_x86_64=('d765627ec6cdfb834823aa81e0840c1b82f357584a493cbb0dfb05a5c6332367')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
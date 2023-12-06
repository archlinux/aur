# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alspotron-bin
_pkgname=Alspotron
pkgver=0.18.0
_electronversion=28
pkgrel=1
pkgdesc="Shows the egg lyrics of the track, playing on Spotify / YouTube Music"
arch=('x86_64')
url="https://github.com/organization/alspotron"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxrandr'
    'at-spi2-core'
    'libxkbcommon'
    'pango'
    'expat'
    'java-runtime'
    'dbus'
    'alsa-lib'
    'nss'
    'nspr'
    'libxdamage'
    'cairo'
    'libxcomposite'
    'libcups'
    'libxcb'
    'gtk3'
    'libdrm'
    'libxext'
    'libxfixes'
    'glib2'
    'libx11'
    'mesa'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('22777dbcc44f4e365b19ef5c8d88498d941d582bcfdd21454604a1cc6f69e06c')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
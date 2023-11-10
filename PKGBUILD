# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tess-bin
_pkgname=Tess
pkgver=0.7_alpha.6
pkgrel=1
pkgdesc="A hackable, simple, rapid and beautiful terminal for the new era of technology."
arch=(
    'i686'
    'x86_64'
)
url="https://tessapp.dev/discord"
_ghurl="https://github.com/SquitchYT/Tess"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'webkit2gtk'
    'gdk-pixbuf2'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-i686-unknown-linux-gnu")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-x86_64-unknown-linux-gnu")
source=(
    "LICENSE::https://raw.githubusercontent.com/SquitchYT/tess/main/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/SquitchYT/Tess/${pkgver//_/-}/src-tauri/icons/icon.png"
)
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '1f08c8a32224226bd1223669faac8f72619cee0375f0449130f8f382e9d64079')
sha256sums_i686=('a3f754c99057c0a236277005eac76c0867c25224fec9ab3d5a0ace9305b08157')
sha256sums_x86_64=('ac8dd424ed8bd0afbd0f2c3e4ec1d416f15c7dacd8f27a96d45dbae164d2f1f2')
build() {
    gendesk -q -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
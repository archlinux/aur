# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tess-bin
_pkgname=Tess
pkgver=0.7_alpha.12
pkgrel=1
pkgdesc="A hackable, simple, rapid and beautiful terminal for the new era of technology.(Prebuilt version)"
arch=(
    'i686'
    'x86_64'
)
url="https://tessapp.dev/discord"
_ghurl="https://github.com/SquitchYT/Tess"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-i686-unknown-linux-gnu")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-x86_64-unknown-linux-gnu")
source=(
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/SquitchYT/Tess/${pkgver//_/-}/src-tauri/icons/icon.png"
)
sha256sums=('1f08c8a32224226bd1223669faac8f72619cee0375f0449130f8f382e9d64079')
sha256sums_i686=('6a392503c136d48e82ea26f6d07aa9ae07c04e9863694f03d8fa6e937a0a2e37')
sha256sums_x86_64=('678b2f75305ce0267993babc35d3cd216063b70c6d58f4ab4dcb0ab337190cec')
prepare() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="System;Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
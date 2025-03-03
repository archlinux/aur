# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tess-bin
_pkgname=Tess
pkgver=0.7_alpha.11
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
    'webkit2gtk'
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
sha256sums_i686=('be388974eb22b0a7679fdbf53aaee201d687352dd7f604ce61ab1a3d041d1335')
sha256sums_x86_64=('a72161e57e13fdfde8aec11f759970af3ce863aa1c0fec00a975a4a15d2e5f98')
prepare() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="System;Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
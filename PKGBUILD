# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=memospot-bin
_pkgname=Memospot
pkgver=0.1.7
pkgrel=1
pkgdesc="Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service."
arch=("x86_64")
url="https://memospot.github.io/"
_ghurl="https://github.com/memospot/memospot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/memospot/memospot/v${pkgver}/LICENSE"
)
sha256sums=('72e4c4acdafe2d187e23871703353b9beacb45d0c86b5439416a11afdbebeae2'
            '7b6871a7c7b860a8a3d9ff677ac8aea44a3dd8aa9e33da91adcd26cc54182cde')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
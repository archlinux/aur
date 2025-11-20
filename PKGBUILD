# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=memos
pkgname="${_appname}pot-bin"
_pkgname=Memospot
pkgver=1.0.1
pkgrel=1
pkgdesc="Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service.(Prebuilt version)"
arch=('x86_64')
url="https://memospot.github.io/"
_ghurl="https://github.com/memospot/memospot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}_linux.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/memospot/memospot/v${pkgver}/LICENSE"
)
sha256sums=('cbd3971ebfb7a61a854bd6110daf977a2d16f9d5477aa2623e8e923a9bf8aaa7'
            '7b6871a7c7b860a8a3d9ff677ac8aea44a3dd8aa9e33da91adcd26cc54182cde')
package() {
    install -Dm755 "${srcdir}/usr/bin/"{"${_appname}","${pkgname%-bin}"} -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=memos
pkgname="${_appname}pot-bin"
_pkgname=Memospot
pkgver=1.0.2
pkgrel=1
pkgdesc="Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service.(Prebuilt version)"
arch=('x86_64')
url="https://memospot.github.io/"
_ghurl="https://github.com/memospot/memospot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/memospot/memospot/v${pkgver}/LICENSE"
)
sha256sums=('67a2a5d60f45f2bdf283507a541f3fbe2de871fe12c7a438da27ed0c787aceb3'
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

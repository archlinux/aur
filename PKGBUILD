# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=memos
pkgname="${_appname}pot-bin"
_pkgname=Memospot
pkgver=1.0.3
pkgrel=1
pkgdesc="Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service.(Prebuilt version)"
arch=('x86_64')
url="https://memospot.github.io/"
_ghurl="https://github.com/memospot/memospot"
license=('BlueOak-1.0.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/memospot/memospot/v${pkgver}/LICENSE.md"
)
sha256sums=('cbcb67179f392c53dc287e558450188f5aa6af1e148d5f84378bc894a5aeef5b'
            '5f279601a1d1c2da10ef493b295bd1ee75fe3d50afdc43ca297769a22ad6d895')
package() {
    install -Dm755 "${srcdir}/usr/bin/"{"${_appname}","${pkgname%-bin}"} -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

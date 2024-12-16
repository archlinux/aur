# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inner-ink-bin
_pkgname="Inner Ink"
pkgver=2.2.1
pkgrel=1
pkgdesc="A Diary app made with Tauri & React for desktop.(Prebuilt version)"
arch=("x86_64")
url="https://github.com/knownasnaffy/inner-ink"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/knownasnaffy/inner-ink/v${pkgver}/LICENSE"
)
sha256sums=('fe8fa471435582a1e11e3cbdafe138ea44a1f9531ecca2f66a1042a05b2e6876'
            '35e25d7ed25ecd3a68185e9ab59b4229c3c4e5957d14bb7737c3fc18af55b766')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

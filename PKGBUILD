# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stayreal-bin
_pkgname=StayReal
pkgver=0.7.0
pkgrel=1
pkgdesc="An open-source, lightweight and privacy-focused alternative client for a popular authentic social network.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://stayreal.vexcited.com/"
_ghurl="https://github.com/StayRealHQ/Universal"
_dlurl="https://nightly.link/StayRealHQ/Universal"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_dlurl}/workflows/nightly/main/${pkgname%-bin}-aarch64-unknown-linux-gnu-rpm.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_dlurl}/workflows/nightly/main/${pkgname%-bin}-armv7-unknown-linux-gnueabihf-rpm.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_dlurl}/workflows/nightly/main/${pkgname%-bin}-x86_64-unknown-linux-gnu-rpm.zip")
sha256sums_aarch64=('98e6dc22a66a069e3679a1d13e2eddf642d27ce9ae73ebc48c909e056b61bf70')
sha256sums_armv7h=('9a8b480021e2beaf71243cdba5afff44c7daf844bd24725a0af87bcb13d99759')
sha256sums_x86_64=('0580a5f492ef1ee867c1940fb04fd896e9f160a5bb08eeaac933434f469f575c')
prepare() {
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-"*.rpm
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}

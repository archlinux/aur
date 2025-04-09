# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stayreal-bin
_pkgname=StayReal
pkgver=0.4.1
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
sha256sums_aarch64=('d13fa829336e932bc3f5bdfbfc644c835f0cedef061da7ea9e2d685f3785ecee')
sha256sums_armv7h=('d953f69ff65009d937975a50e2b618c76bcf8e69ac4fea360286e735f37cb779')
sha256sums_x86_64=('177e5478249ded50580b36067adcfe3ce84d4b0ebb0a51c585bc4f38fdeb6d1b')
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
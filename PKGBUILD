# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stayreal-bin
_pkgname=StayReal
pkgver=0.5.0
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
sha256sums_aarch64=('736accebe016d4819de56ca3f277ab412c44b6f49eb2b9d662e718381930c3ef')
sha256sums_armv7h=('d140733ffd2ce4797dc54afe17e575631d85d268cff2f9938f355d4f01d8526e')
sha256sums_x86_64=('56a3b39ce98bb6c6a00b0131de0f3dcfeb803cf6e3f70e8af9b6340474f7211e')
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

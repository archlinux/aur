# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stayreal-bin
_pkgname=StayReal
pkgver=0.6.1
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
sha256sums_aarch64=('2e7f7e1ca8e7581235d7f61fc6b24ee731b3a1f4de292978eef790cac0bfef94')
sha256sums_armv7h=('97bf3cb6bc796bd9141eb70dec7120f7313043f0650a00713bdb66d72988495a')
sha256sums_x86_64=('99ba24234db1fdcfb5ea6c34868c2bb3de30a0e9061d7e7b414dc8139977f814')
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
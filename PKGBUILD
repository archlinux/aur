# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airgorah-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A WiFi auditing software that can perform deauth attacks and passwords cracking"
arch=("x86_64")
url="https://crates.io/crates/airgorah"
_githuburl="https://github.com/martin-olivier/airgorah"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk4' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/martin-olivier/airgorah/v${pkgver}/LICENSE")
sha256sums=('8afffb983a515a4c6c19b92d4131fbe26c50e7a17591bd8b0ad14df3a74ecae7'
            'f15292d482b98b47c9ceb28e1f540c4522c10b19c52ebd416d10e540999570d0')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/app-install/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/com.martin-olivier.${pkgname%-bin}.desktop"
    echo -e "\nCategories=System;Utility;" >> "${srcdir}/usr/share/applications/com.martin-olivier.${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/etc/${pkgname%-bin}/config.toml" -t "${pkgdir}/etc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/com.martin-olivier.${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/app-install/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
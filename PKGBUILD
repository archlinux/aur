# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airgorah-bin
_appname="com.martin-olivier.${pkgname%-bin}"
pkgver=0.4.2
pkgrel=1
pkgdesc="A WiFi auditing software that can perform deauth attacks and passwords cracking"
arch=("x86_64")
url="https://crates.io/crates/airgorah"
_githuburl="https://github.com/martin-olivier/airgorah"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk4' 'glibc')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_${CARCH}.pkg.tar.zst"
    "LICENSE::https://raw.githubusercontent.com/martin-olivier/airgorah/v${pkgver}/LICENSE")
sha256sums=('72361dae5ef00b5a2f4ecfdbc9937e7abe77aad9bedce00e17df001cc04b4eaa'
            'f15292d482b98b47c9ceb28e1f540c4522c10b19c52ebd416d10e540999570d0')
build() {
    sed "s|/usr/share/pixmaps/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/etc/${pkgname%-bin}/config.toml" -t "${pkgdir}/etc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
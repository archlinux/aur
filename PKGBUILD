# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airgorah-bin
_appname="com.martin-olivier.${pkgname%-bin}"
pkgver=0.5.0
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
sha256sums=('8c96ada9892709e9dc03987b15851c8101fdb95179d464471f938e5ed4b4f7c3'
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
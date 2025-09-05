# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airgorah-bin
_appname="com.martin-olivier.${pkgname%-bin}"
pkgver=0.7.4
pkgrel=1
pkgdesc="A WiFi auditing software that can perform deauth attacks and passwords cracking.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://crates.io/crates/airgorah"
_ghurl="https://github.com/martin-olivier/airgorah"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'gtk4'
    'aircrack-ng'
    'macchanger'
)
optdepends=(
    'crunch'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_aarch64.pkg.tar.zst")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_x86_64.pkg.tar.zst")
sha256sums_aarch64=('e42293328940316f7f5ce6fe5266af9248c364b4c957d6b0776787cfa14a7d7d')
sha256sums_x86_64=('827f9a0dfa312f072bbcf7c9f34db9f86428c687d2ebd6b38978e5f43ca9d13d')
prepare() {
    sed -i "s/\/usr\/share\/pixmaps\/${pkgname%-bin}.png/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/etc/${pkgname%-bin}/config.toml" -t "${pkgdir}/etc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

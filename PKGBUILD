# Maintainer: molivier <martin dot olivier at live dot fr>

pkgname=airgorah
pkgver=0.7.2
pkgrel=1
pkgdesc="A WiFi security auditing software mainly based on aircrack-ng tools suite"
arch=("any")
url="https://github.com/martin-olivier/airgorah"
license=("MIT")

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('453664661ba7dcf013a6ae61b5b5d19ef431eedcbad74bba0cad1fb6181c82f0')

provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

depends=(
    'bash'
    'dbus'
    'xterm'
    'polkit'
    'gtk4'
    'aircrack-ng'
    'iproute2'
    'iw'
    'macchanger'
    'wireshark-cli'
    'mdk4'
    'adwaita-icon-theme'
)
makedepends=(
    'base-devel'
    'rust'
    'gtk4'
    'glib2'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "icons/app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "package/config.toml" -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 "package/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "package/.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname}.policy"

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

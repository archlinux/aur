# Maintainer: molivier <martin dot olivier at live dot fr>

pkgname=airgorah
pkgver=0.7.3
pkgrel=1
pkgdesc="A WiFi security auditing software mainly based on aircrack-ng tools suite"
arch=("any")
url="https://github.com/martin-olivier/airgorah"
license=("MIT")

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00c3b9cf91a728b1466ab8fcc7590245f3136ccd539ea1cf5be95f2c1c87920b')

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

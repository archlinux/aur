# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=twc-rs-bin
_pkgname=twc-rs
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast CLI and interactive TUI dashboard for managing Timeweb Cloud infrastructure"
arch=('x86_64')
url="https://github.com/RAprogramm/twc-rs"
license=('MIT')
provides=('twc-rs')
conflicts=('twc-rs')
options=('!strip')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
# Replace with the real checksum per release, e.g.:
#   updpkgsums   (from pacman-contrib), or
#   sha256sum twc-rs-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
sha256sums=('1d56db9042635ab74fb73603ebb427f2b3e7c5957f967c18894a425805c387f7')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Stage completions read-only; the .install scriptlet activates them for the
    # shells the user actually has installed.
    local bin="${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 <("${bin}" completions bash) \
        "${pkgdir}/usr/share/twc-rs/completions/${_pkgname}.bash"
    install -Dm644 <("${bin}" completions zsh) \
        "${pkgdir}/usr/share/twc-rs/completions/_${_pkgname}"
    install -Dm644 <("${bin}" completions fish) \
        "${pkgdir}/usr/share/twc-rs/completions/${_pkgname}.fish"
    install -Dm644 <("${bin}" completions nushell) \
        "${pkgdir}/usr/share/twc-rs/completions/${_pkgname}.nu"
}

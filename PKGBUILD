# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=twc-rs-bin
_pkgname=twc-rs
pkgver=0.3.6
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
sha256sums=('584341471ae7ae9ecb46ce3a7e10180b87fa61eeb3f37a5ae7c1a01a905292d6')

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

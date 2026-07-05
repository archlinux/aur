# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=twc-rs-bin
_pkgname=twc-rs
pkgver=0.5.1
pkgrel=3
pkgdesc="Fast CLI and interactive TUI dashboard for managing Timeweb Cloud infrastructure"
arch=('x86_64')
url="https://github.com/RAprogramm/twc-rs"
license=('MIT')
provides=('twc-rs')
conflicts=('twc-rs')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
        "${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/RAprogramm/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('64e6943efa10dd94765c5a64bab203910a626ed346c8a0cf62679c206facdf03' '5c0c4235b69837927ece7047dd9711553aa9c41c519ddda6e3dcdab443ca12f0')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # The packaged binary targets the build architecture, so it can generate
    # its own completions; they go straight into the shells' vendor paths.
    local bin="${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 <("${bin}" completions bash) \
        "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 <("${bin}" completions zsh) \
        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 <("${bin}" completions fish) \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <("${bin}" completions nushell) \
        "${pkgdir}/usr/share/nushell/vendor/autoload/${_pkgname}.nu"
}

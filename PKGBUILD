# Maintainer: @aardbol
pkgname=ironclaw-bin
_pkgname=ironclaw
pkgver=1.4.1
pkgrel=1
pkgdesc="IronClaw is an Agent OS focused on privacy, security and extensibility"
arch=('x86_64' 'aarch64')
url="https://github.com/nearai/ironclaw"
license=('Apache-2.0')
options=('!strip' '!debug')

source=(
    "${_pkgname}-${pkgver}.bash::${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.bash"
    "${_pkgname}-${pkgver}.fish::${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.fish"
    "${_pkgname}-${pkgver}.zsh::${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.zsh"
)
source_x86_64=("${_pkgname}-x86_64-${pkgver}-linux-gnu.tar.gz::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-aarch64-${pkgver}-linux-gnu.tar.gz::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('4886a92acb38c8478e6b9d377a92025c3ac01b1aa88ccccce67f3c0c3dc36f1b'
            '983bb7d3dea28d31f6fd3e6368d5d42a499db4f9aa076fc86d2d32c298c0db63'
            '08a209a0123a017691c04b2428826e1303ff8edab521af99839013880aacdda8')
sha256sums_x86_64=('72b893d3e8f5f5a431cfaf9bc48e9dae71755e2d049ab4119c0646d352da4630')
sha256sums_aarch64=('30acf81b5b8ec71e34547a27a43ef0bbc4bae8495745fee2e11ce3067718743b')

package() {
    local target="${_pkgname}-${CARCH}-unknown-linux-gnu"
    tar -xzf "$srcdir/${_pkgname}-${CARCH}-${pkgver}-linux-gnu.tar.gz"
    install -Dm755 "$srcdir/$target/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

    # Shell completions
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

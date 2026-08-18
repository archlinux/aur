# Maintainer: @aardbol
pkgname=ironclaw-bin
_pkgname=ironclaw
pkgver=1.2.0
pkgrel=2
pkgdesc="IronClaw is an Agent OS focused on privacy, security and extensibility"
arch=('x86_64' 'aarch64')
url="https://github.com/nearai/ironclaw"
license=('Apache-2.0')
options=('!strip' '!debug')

source=(
    "${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.bash"
    "${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.fish"
    "${url}/raw/refs/tags/${_pkgname}-v${pkgver}/ironclaw.zsh"
)
source_x86_64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('4886a92acb38c8478e6b9d377a92025c3ac01b1aa88ccccce67f3c0c3dc36f1b'
            '983bb7d3dea28d31f6fd3e6368d5d42a499db4f9aa076fc86d2d32c298c0db63'
            '08a209a0123a017691c04b2428826e1303ff8edab521af99839013880aacdda8')
sha256sums_x86_64=('81feea64c17c79228b6b582934011ba96349cbd1c7ecd522780127400b6739e8')
sha256sums_aarch64=('b406203faf462d27276127a2faa11ae0f1d55e00e3b8dd18832d65460c328453')

package() {
    local target="${_pkgname}-${CARCH}-unknown-linux-gnu"
    tar -xzf "$srcdir/${target}.tar.gz"
    install -Dm755 "$srcdir/$target/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

    # Shell completions
    install -Dm644 "${srcdir}/ironclaw.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "${srcdir}/ironclaw.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "${srcdir}/ironclaw.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

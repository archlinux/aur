# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=javinizer-bin
pkgver=1.0.0.rc3
pkgrel=1
pkgdesc="A metadata scraper and file organizer for Japanese Adult Videos (JAV), with CLI, TUI, REST API, and a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/javinizer/javinizer-go"
license=('MIT')
provides=('javinizer')
conflicts=('javinizer')

_tag="v${pkgver/.rc/-rc}"
source_x86_64=(
    "${pkgname}-${pkgver}::${url}/releases/download/${_tag}/javinizer-linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/javinizer/javinizer-go/${_tag}/LICENSE")
source_aarch64=(
    "${pkgname}-${pkgver}::${url}/releases/download/${_tag}/javinizer-linux-arm64"
    "LICENSE::https://raw.githubusercontent.com/javinizer/javinizer-go/${_tag}/LICENSE")
sha256sums_x86_64=(
    'ee69461d57e8f2b206597b4d94e5398ba2838a05bb572a90c09b2d6415383100'
    'SKIP')
sha256sums_aarch64=(
    '3b1329172119f1f97af6d64c82079123d7d51cb461e20bbc4f616b5a939014dc'
    'SKIP')

package() {
    cd "${srcdir}"
    local _bin="${pkgname}-${pkgver}"
    chmod +x "${_bin}"

    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/javinizer"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ./"${_bin}" completion bash 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/javinizer"
    ./"${_bin}" completion zsh 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_javinizer"
    ./"${_bin}" completion fish 2>/dev/null \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/javinizer.fish"
}

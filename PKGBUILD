# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=javinizer-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A metadata scraper and file organizer for JAV, with CLI, TUI, REST API, and a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/javinizer/javinizer-go"
license=('MIT')
provides=('javinizer')
conflicts=('javinizer')

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/javinizer-linux-amd64"
    "LICENSE::https://raw.githubusercontent.com/javinizer/javinizer-go/v${pkgver}/LICENSE")
source_aarch64=(
    "${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/javinizer-linux-arm64"
    "LICENSE::https://raw.githubusercontent.com/javinizer/javinizer-go/v${pkgver}/LICENSE")
sha256sums_x86_64=('a239786acd95dc8992c6600252c52f80a50c3c05449c988c09f67fb17cf9a6a1'
                   'bc81733f13dea3d54a631b130ef44b513669de176868f26431d923921480a4f3')
sha256sums_aarch64=('eeaf9cfd0f768f07fc83f54333704af23a77578cb703e6cd6b84ec9e51d94a8f'
                    'bc81733f13dea3d54a631b130ef44b513669de176868f26431d923921480a4f3')

package() {
    cd "${srcdir}"
    local _bin="${pkgname}-${pkgver}-${arch}"
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

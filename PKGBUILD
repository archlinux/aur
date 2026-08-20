# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=claude-squad-bin
pkgver=1.0.20
pkgrel=1
pkgdesc='Manage multiple AI terminal agents like Claude Code, Aider, Codex, OpenCode and Amp'
arch=('x86_64' 'aarch64')
url='https://github.com/smtg-ai/claude-squad'
license=('AGPL-3.0-or-later')
depends=('tmux' 'git')
provides=('claude-squad')
conflicts=('claude-squad')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/claude-squad_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/claude-squad_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('42574a4e1700119774f21fb4ced45df4fb1e0bde74a2132e7bca537b050c4863')
sha256sums_aarch64=('9139d192d77f4d35209f7e6c81beb64264dd78f86933f6b2ef35574b7a8c7102')

package() {
    install -Dm755 claude-squad "${pkgdir}/usr/bin/claude-squad"
    ln -s /usr/bin/claude-squad "${pkgdir}/usr/bin/cs"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/claude-squad/README.md"

    ./claude-squad completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/claude-squad"
    ./claude-squad completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_claude-squad"
    ./claude-squad completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/claude-squad.fish"
}

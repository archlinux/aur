# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=claude-squad-bin
pkgver=1.0.19
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
sha256sums_x86_64=('8ece7d2c374c85c416267e48b542552ae0e0dd1d4031d3c78be62a13efff7e61')
sha256sums_aarch64=('dec9e59b0063481bf42118bc70b067198fb6620cd62818ef95562fd92e361e2c')

package() {
    install -Dm755 claude-squad "${pkgdir}/usr/bin/claude-squad"
    ln -s /usr/bin/claude-squad "${pkgdir}/usr/bin/cs"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/claude-squad/README.md"

    ./claude-squad completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/claude-squad"
    ./claude-squad completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_claude-squad"
    ./claude-squad completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/claude-squad.fish"
}

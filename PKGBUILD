# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=claude-squad-bin
pkgver=1.0.17
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
sha256sums_x86_64=('3c655a51944287819d21ccdd2dc50d331e316ecab3dacd6fe3437ea65b1da2f7')
sha256sums_aarch64=('70d22a60f4b47881dee5082d0e132f78ee73d655da4e27a223d9d24c322107f3')

package() {
    install -Dm755 claude-squad "${pkgdir}/usr/bin/claude-squad"
    ln -s /usr/bin/claude-squad "${pkgdir}/usr/bin/cs"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/claude-squad/README.md"

    ./claude-squad completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/claude-squad"
    ./claude-squad completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_claude-squad"
    ./claude-squad completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/claude-squad.fish"
}

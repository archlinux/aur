# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=agent-of-empires-bin
pkgver=1.15.1
pkgrel=2
pkgdesc='Terminal session manager for AI coding agents (Claude Code, Codex, OpenCode)'
arch=('x86_64' 'aarch64')
url='https://github.com/njbrake/agent-of-empires'
license=('MIT')
depends=('gcc-libs' 'zlib' 'tmux')
provides=('agent-of-empires')
conflicts=('agent-of-empires')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/main/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-arm64.tar.gz")
sha256sums=('b37140699c292ab0346f8e2fc4b98a668227388805d3eca0e9e14d026542ead0')
sha256sums_x86_64=('da198ef269f43ac7032022051990a2a31f2208d9d67c0bb0451914d20483b8ca')
sha256sums_aarch64=('b017640bf107edbb26b65c2aca96d8130ea50ca8c3e4d9d0ae04543ee7762a20')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 aoe-linux-amd64 "$pkgdir/usr/bin/aoe"
    else
        install -Dm755 aoe-linux-arm64 "$pkgdir/usr/bin/aoe"
    fi

    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/aoe" completion bash > "$pkgdir/usr/share/bash-completion/completions/aoe"
    "$pkgdir/usr/bin/aoe" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_aoe"
    "$pkgdir/usr/bin/aoe" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/aoe.fish"

    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}

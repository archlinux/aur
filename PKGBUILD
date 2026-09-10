# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=agent-of-empires-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='Terminal session manager for AI coding agents (Claude Code, Codex, OpenCode)'
arch=('x86_64' 'aarch64')
url='https://github.com/agent-of-empires/agent-of-empires'
license=('MIT')
depends=('gcc-libs' 'zlib' 'tmux')
provides=('agent-of-empires')
conflicts=('agent-of-empires')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/main/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-arm64.tar.gz")
sha256sums=('b37140699c292ab0346f8e2fc4b98a668227388805d3eca0e9e14d026542ead0')
sha256sums_x86_64=('5021422865933fa84c5fcb4dcb03e06099d786e2727745c426365df43874cbd1')
sha256sums_aarch64=('750efd27cb621447ba0e42521ed5aefa89058dd03b29cbfe79ed43566dfabdde')

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

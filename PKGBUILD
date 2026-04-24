# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=agent-of-empires-bin
pkgver=1.4.6
pkgrel=1
pkgdesc='Terminal session manager for AI coding agents (Claude Code, Codex, OpenCode)'
arch=('x86_64' 'aarch64')
url='https://github.com/njbrake/agent-of-empires'
license=('MIT')
depends=('gcc-libs' 'zlib' 'tmux')
provides=('agent-of-empires')
conflicts=('agent-of-empires')
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/aoe-linux-arm64.tar.gz")
sha256sums_x86_64=('ee83752d8ad44acde8ef94cb6e8f6bec86dd7433d4534a7dc81e7e05e25f54c8')
sha256sums_aarch64=('140b3b300541b654e406e17c654b16fd65e3fb87d90107d089efc9682be59aff')

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

    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    curl -sL "${url}/raw/main/LICENSE" -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=agent-of-empires-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='Terminal session manager for AI coding agents (Claude Code, Codex, OpenCode)'
arch=('x86_64' 'aarch64')
url='https://github.com/njbrake/agent-of-empires'
license=('MIT')
depends=('gcc-libs' 'zlib' 'tmux')
provides=('agent-of-empires')
conflicts=('agent-of-empires')
source_x86_64=("${url}/releases/download/v${pkgver}/aoe-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/aoe-linux-arm64.tar.gz")
sha256sums_x86_64=('765546bd37c1d7d0b85a6c6283a93b8134a27d59ce3836c4180197841a6038c0')
sha256sums_aarch64=('09d09538568612c3bc8bca629e7efd00520761ebdbaf774f168d091c3fcec77e')

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

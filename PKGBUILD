# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/omni"
license=('BSL-1.1')
provides=('omnictl')
conflicts=('omnictl')

source_x86_64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-amd64")
source_aarch64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-arm64")

sha256sums_x86_64=('bc08eed0cc90d4f3057a25e7ae09093bd00a79eb46c91a3200b65d9435975d15')
sha256sums_aarch64=('bc08eed0cc90d4f3057a25e7ae09093bd00a79eb46c91a3200b65d9435975d15')

package() {
    install -Dm755 "omnictl-${pkgver}" "${pkgdir}/usr/bin/omnictl"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/omnictl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/omnictl"
    "${pkgdir}/usr/bin/omnictl" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_omnictl"
    "${pkgdir}/usr/bin/omnictl" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/omnictl.fish"
}

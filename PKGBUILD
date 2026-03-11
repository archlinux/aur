# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.5.10
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/omni"
license=('BSL-1.1')
provides=('omnictl')
conflicts=('omnictl')

source_x86_64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-amd64")
source_aarch64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-arm64")

sha256sums_x86_64=('569ab2ebc8c743179390bd6f145ca2f20900413a3ad963e89613dc49c208075b')
sha256sums_aarch64=('569ab2ebc8c743179390bd6f145ca2f20900413a3ad963e89613dc49c208075b')

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

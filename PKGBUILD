# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64')
url="https://github.com/siderolabs/omni"
license=('BSL-1.1')
provides=('omnictl')
conflicts=('omnictl')
source=("omnictl-${pkgver}::https://github.com/siderolabs/omni/releases/download/v${pkgver}/omnictl-linux-amd64")
sha256sums=('009cc5126b1441203a9bd3b1303cd8f0b2affcdfe764385a6673670918d3a5ae')

package() {
    install -Dm755 "omnictl-${pkgver}" "${pkgdir}/usr/bin/omnictl"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "./omnictl-${pkgver}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/omnictl"
    "./omnictl-${pkgver}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_omnictl"
    "./omnictl-${pkgver}" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/omnictl.fish"
}

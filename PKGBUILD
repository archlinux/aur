# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.5.8
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64')
url="https://github.com/siderolabs/omni"
license=('BSL-1.1')
provides=('omnictl')
conflicts=('omnictl')
source=("omnictl-${pkgver}::https://github.com/siderolabs/omni/releases/download/v${pkgver}/omnictl-linux-amd64")
sha256sums=('84cc2faa51d9d76fd22c606c138b20a65967a56db79b5026892a1833274da055')

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

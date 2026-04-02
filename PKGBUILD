# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/omni"
license=('BUSL-1.1')
provides=('omnictl')
conflicts=('omnictl')

source=("omni-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-amd64")
source_aarch64=("omnictl-${pkgver}::$url/releases/download/v$pkgver/omnictl-linux-arm64")

sha256sums=('a9ccb6cd2fb489d2ec0b5f11bf2f830ebff58e86a548eff00f5f0027403afa82')
sha256sums_x86_64=('f44e21b871208109228f701a6e04b80a54faea19206ee2cfa5d272052902f44b')
sha256sums_aarch64=('f44e21b871208109228f701a6e04b80a54faea19206ee2cfa5d272052902f44b')

package() {
    install -Dm755 "omnictl-${pkgver}" "${pkgdir}/usr/bin/omnictl"
    install -Dm644 "omni-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/$pkgname"
    install -Dm644 "omni-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/omnictl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/omnictl"
    "${pkgdir}/usr/bin/omnictl" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_omnictl"
    "${pkgdir}/usr/bin/omnictl" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/omnictl.fish"
}

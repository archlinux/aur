# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.6.2
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

sha256sums=('32e08364908e3ad40989ef651b37e567a79a6a27ec33bbd100e924be01189424')
sha256sums_x86_64=('e63472ce086c394fef6c0c42c393b559a660232cbbc9bddec95023f3ef642290')
sha256sums_aarch64=('e63472ce086c394fef6c0c42c393b559a660232cbbc9bddec95023f3ef642290')

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

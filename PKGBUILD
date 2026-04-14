# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>
pkgname=omnictl-bin
pkgver=1.6.5
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

sha256sums=('b15545f4e431a42b3b4b751d9d9b1aa87d0eb9f0fccc04c973e5cf3ed5bcca82')
sha256sums_x86_64=('df26f96d803ce32117dd54b5e1cd02c14639089960e31022b15548ef06dba5a1')
sha256sums_aarch64=('df26f96d803ce32117dd54b5e1cd02c14639089960e31022b15548ef06dba5a1')

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

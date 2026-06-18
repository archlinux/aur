# Maintainer: Guru <anjanaya@gmail.com>
pkgname=grafanactl-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="CLI tool for managing Grafana resources as code"
arch=('x86_64' 'aarch64')
url="https://github.com/grafana/grafanactl"
license=('Apache-2.0')
provides=('grafanactl')
conflicts=('grafanactl')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/grafana/grafanactl/releases/download/v${pkgver}/grafanactl_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/grafana/grafanactl/releases/download/v${pkgver}/grafanactl_Linux_arm64.tar.gz")
sha256sums_x86_64=('7f785c8be5ab6210579ae2bc0fddb9cdf180a2d59d928935adba8e581b69cfa9')
sha256sums_aarch64=('8ea4b29606b9e39eb3882d0d6d38d21c2dd99cf4fdc7a7ef846e7488d83e8832')

package() {
    install -Dm755 "${srcdir}/grafanactl" "${pkgdir}/usr/bin/grafanactl"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${srcdir}/grafanactl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/grafanactl"
    "${srcdir}/grafanactl" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_grafanactl"
    "${srcdir}/grafanactl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/grafanactl.fish"
}

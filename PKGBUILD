# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>


pkgname=omnictl-bin
pkgver=1.10.4
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/omni"
license=('BUSL-1.1')
provides=('omnictl')
conflicts=('omnictl')

source=("omni-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("omnictl-${pkgver}::${url}/releases/download/v${pkgver}/omnictl-linux-amd64")
source_aarch64=("omnictl-${pkgver}::${url}/releases/download/v${pkgver}/omnictl-linux-arm64")

sha256sums=('eee709782006e4a60881cafe16ff01cf4f1974b0f57ddb35be8ed7d40a8b6de1')
sha256sums_x86_64=('166e7124800dbb415fe15a8c920455405b8c323ce7c07a5f3a1d7859d5ea3738')
sha256sums_aarch64=('166e7124800dbb415fe15a8c920455405b8c323ce7c07a5f3a1d7859d5ea3738')

package() {
  install -Dm755 "omnictl-${pkgver}" "${pkgdir}/usr/bin/omnictl"
  install -Dm644 "omni-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/$pkgname"
  install -Dm644 "omni-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/omnictl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/omnictl"
  "${pkgdir}/usr/bin/omnictl" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_omnictl"
  "${pkgdir}/usr/bin/omnictl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/omnictl.fish"
}

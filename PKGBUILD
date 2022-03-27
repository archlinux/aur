# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=cr-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="cr is a tool designed to help GitHub repos self-host their own chart repos by adding Helm chart artifacts to GitHub Releases"
provides=('cr' 'chart-releaser')
url="https://github.com/helm/chart-releaser"
arch=('x86_64' 'aarch64')
license=("APACHE")

source_x86_64=("${url}/releases/download/v${pkgver}/chart-releaser_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/chart-releaser_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('6449c52bc7568d6e345667a3ceea826db2ac04e7eec9a68b5c3b4673e21e5d6a')
sha256sums_aarch64=('ae292eb6488b11bee6a6061683b719cce833900b4f20a5894ab921f39bc30bcb')

package() {
  install -Dm755 "${srcdir}/cr" "${pkgdir}/usr/bin/cr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cr/LICENSE"

  "${pkgdir}/usr/bin/cr" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/cr"
  "${pkgdir}/usr/bin/cr" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/cr.fish"
  "${pkgdir}/usr/bin/cr" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_cr"
}

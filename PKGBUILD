# Maintainer: agony <27015 at riseup dot net>

pkgname=kubecm-bin
pkgver=0.36.0
pkgrel=1
pkgdesc='Manage your kubeconfig more easily (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/sunny0826/kubecm'
license=('Apache-2.0')
provides=("kubecm=${pkgver}")
conflicts=('kubecm')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/kubecm_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${_release}/kubecm_v${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('a014e57c0a8f659a76210c5b97393f306340bbd45296a168f5e47f095a132611')
sha256sums_aarch64=('aff313d3298cea88cf4f662d23654a24c8fd3242b3e7f84436b0869b06e2fa71')

build() {
  for shell in bash fish zsh; do
    ./kubecm completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 kubecm -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/kubecm"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubecm.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubecm"
}

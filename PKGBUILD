# Maintainer: Jonathan Wright <jon@than.io>

pkgname=kubecolor-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="A tool to colorize the output of kubectl commands"
arch=('x86_64')
url="https://github.com/kubecolor/kubecolor"
license=('MIT')
provides=("kubecolor=${pkgver}")
conflicts=("kubecolor")

source_x86_64=("kubecolor-${pkgver}.tar.gz::https://github.com/kubecolor/kubecolor/releases/download/v${pkgver}/kubecolor_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('87289f8641ba18f4cb491ad6b30baa0da5f769c688aa7ce05489604da6099b28')
options=("!strip")

package() {
  "${srcdir}/kubecolor" completion bash > kubecolor.bash
  "${srcdir}/kubecolor" completion fish > kubecolor.fish
  "${srcdir}/kubecolor" completion zsh > kubecolor.zsh

  install -D -g root -m 0755 -o root "${srcdir}/kubecolor" "${pkgdir}/usr/bin/kubecolor"
  install -D -g root -m 0644 -o root LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 kubecolor.bash "${pkgdir}/usr/share/bash-completion/completions/kubecolor"
  install -Dm644 kubecolor.fish "${pkgdir}/usr/share/fish/completions/kubecolor.fish"
  install -Dm644 kubecolor.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubecolor"
}

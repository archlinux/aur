# Maintainer: Jonathan Wright <jon@than.io>

pkgname=kubecolor-bin
pkgver=0.8.0
pkgrel=3
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
  install -Dm755 "${srcdir}/kubecolor" "${pkgdir}/usr/bin/kubecolor"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  "${pkgdir}/usr/bin/kubecolor" completion bash > "${srcdir}/kubecolor.bash"
  install -Dm644 "${srcdir}/kubecolor.bash" "${pkgdir}/usr/share/bash-completion/completions/kubecolor"

  "${pkgdir}/usr/bin/kubecolor" completion fish > "${srcdir}/kubecolor.fish"
  install -Dm644 "${srcdir}/kubecolor.bash" "${pkgdir}/usr/share/fish/completions/kubecolor.fish"

  "${pkgdir}/usr/bin/kubecolor" completion zsh > "${srcdir}/kubecolor.zsh"
  install -Dm644 "${srcdir}/kubecolor.zsh" "${pkgdir}/usr/share/zsh/site-functions/_kubecolor"
}

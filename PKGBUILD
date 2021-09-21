# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq-bin
pkgver=4.13.2
pkgrel=1
pkgdesc="portable command-line YAML processor"
arch=("x86_64")
url=https://github.com/mikefarah/yq
license=('MIT')
depends=()
makedepends=()
conflicts=('yq' 'go-yq')
providers=('yq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mikefarah/yq/releases/download/v${pkgver}/yq_linux_amd64.tar.gz")
sha256sums=('b462478cfee8fb02b1b6bbee87b2b1d2f0ef4f0b693a95c04308006f04cc525e')

package() {
  install -Dm0755 "${srcdir}/yq_linux_amd64" "${pkgdir}/usr/bin/yq"

  "${pkgdir}/usr/bin/yq" shell-completion bash | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/bash-completion/completions/yq"
  "${pkgdir}/usr/bin/yq" shell-completion zsh | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/zsh/site-functions/_yq"
  "${pkgdir}/usr/bin/yq" shell-completion fish | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/fish/vendor_completions.d/yq.fish"
}

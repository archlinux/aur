# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq-bin
pkgver=4.13.0
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
sha256sums=('2b52c2be869818f7518af0272021fda0dd4622365a5eb4a809279bcb4f373f5b')

package() {
  install -Dm0755 "${srcdir}/yq_linux_amd64" "${pkgdir}/usr/bin/yq"

  "${pkgdir}/usr/bin/yq" shell-completion bash | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/bash-completion/completions/yq"
  "${pkgdir}/usr/bin/yq" shell-completion zsh | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/zsh/site-functions/_yq"
  "${pkgdir}/usr/bin/yq" shell-completion fish | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/fish/vendor_completions.d/yq.fish"
}

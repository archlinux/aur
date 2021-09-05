# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq-bin
pkgver=4.12.2
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
sha256sums=('90338afec75f93f0856f86ec7f9f96f8cf317cd05af678601b08d382fe610a34')

package() {
  install -Dm0755 "${srcdir}/yq_linux_amd64" "${pkgdir}/usr/bin/yq"

  "${pkgdir}/usr/bin/yq" shell-completion bash | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/bash-completion/completions/yq"
  "${pkgdir}/usr/bin/yq" shell-completion zsh | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/zsh/site-functions/_yq"
  "${pkgdir}/usr/bin/yq" shell-completion fish | install -Dm0644 /dev/stdin \
    "${pkgdir}/usr/share/fish/vendor_completions.d/yq.fish"
}

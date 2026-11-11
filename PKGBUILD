# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ctx-bin
pkgver=0.1.19
pkgrel=1
pkgdesc='Multi-environment context switcher for cloud, Kubernetes, VPN, and SSH tunnels'
arch=('x86_64')
url='https://github.com/vlebo/ctx'
license=('MIT')
provides=('ctx')
conflicts=('ctx')
source=("ctx-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/ctx_${pkgver}_linux_amd64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/vlebo/ctx/v${pkgver}/LICENSE"
        "README.md-${pkgver}::https://raw.githubusercontent.com/vlebo/ctx/v${pkgver}/README.md")
sha256sums=('7da9516ac884092bae56b3829577b058c9578afc5e7765941b9f9fa5ba53378b'
            '57a693be29787ddb226a44c770fde19f9542433564b9cf4866b5a46aea996872'
            '83fd2ca942ddeef92c17601821108ef009db6c62c284a8569c1a7fc8b6872970')

package() {
  install -Dm755 ctx "${pkgdir}/usr/bin/ctx"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Shell completions
  ./ctx completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ctx"
  ./ctx completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ctx.fish"
  ./ctx completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ctx"
}

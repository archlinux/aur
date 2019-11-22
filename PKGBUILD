# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.17.0_rc.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver/_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver/_/-}/bin/linux/amd64/kubectl")
sha512sums=('66eb876711b2443b9c7cdcdfbf8aa303c4962850aaa8595701b2d94c2f7b6bc0384e29676e08d932207d928f6fbfecb0f3c93822272e9cf0520a251ef7791494')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver/_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

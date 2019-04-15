# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.14.2_beta.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('apache')
provides=('kubectl' 'kubectl-bin')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl")
sha512sums=('552763bb1da248bb4c32a9146d3be504ed8e49e8c13482538e8fb16aaf7a2f46dfc37e4f243f8abadcb563c35d27622a27ffb09db5be62ad5eeb39c67485b014')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

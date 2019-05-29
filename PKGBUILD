# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.15.0_beta.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl' 'kubectl-bin')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl")
sha512sums=('cf3d4ae9d6b21d67166c3a1fc89872495573b69a7a03875567f1c7c671bb0e8df64d7b032820eb50fcb95f3d4492e7e9807eda218cdc68275c26b9e105d49e79')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

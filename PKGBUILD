# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.16.0_alpha.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver/_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver/_/-}/bin/linux/amd64/kubectl")
sha512sums=('855f8d1a09a5684cebda701986a1123b15a5d472c404ca09044c01907268e7f1ab724d472a8566f00c8305f7e026746fac15e3bab2829ed780341ad1c8f2454e')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver/_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

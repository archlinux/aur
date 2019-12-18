# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.18.0_alpha.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver/_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver/_/-}/bin/linux/amd64/kubectl")
sha512sums=('245646020005effccc6a1dad68fde34d634f54134908aa3c18bf4be52b54d7f79beb87aadae39281106bd689ce83c39853f6b1eb2267397c197697812cbf891c')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver/_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

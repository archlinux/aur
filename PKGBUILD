# Maintainer: David Birks <david@birks.dev>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.19.0_alpha.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver/_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver/_/-}/bin/linux/amd64/kubectl")
sha512sums=('5a0b9b4dc082ad7e6fb48e4d3387500906df7c0c56def01e031cf386e4761e87bf60793dafcd2b36c9fadca46a7c864504ace7ad463ef9bb9b25a3de59558513')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver/_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

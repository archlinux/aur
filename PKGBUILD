# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.15.0_alpha.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl' 'kubectl-bin')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver//_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver//_/-}/bin/linux/amd64/kubectl")
sha512sums=('92dc443c5e3fa9491fd32a062697228e756fa059a9e66df4a1bcc3c254f59b3dfdee7901bda559ac963d7d3f79b944a0ad70b01b9f6463e92705cbe6c52e99bc')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver//_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

# Maintainer: David Birks <david@tellus.space>
# Contributor: colemickens <cole.mickens@gmail.com>

pkgname=kubectl-beta-bin
pkgdesc="Command-line tool for deploying and managing applications on Kubernetes (beta)"
pkgver=1.17.0_rc.2
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes/kubernetes"
license=('Apache')
provides=('kubectl')
conflicts=('kubectl' 'kubectl-bin' 'kubernetes>=1.4.6')
source=("kubectl-${pkgver/_/-}::https://storage.googleapis.com/kubernetes-release/release/v${pkgver/_/-}/bin/linux/amd64/kubectl")
sha512sums=('bb99e22cbdde823c7156bfae3c2f8e72ede1425a80aa2db6b33a4e7bfec86ca44cba528a98fd240f625c445b897a376d84058e3a77afbb1af4dad78e71579ae1')

package() {
  install -Dm 755 "$srcdir/kubectl-${pkgver/_/-}" "$pkgdir/usr/bin/kubectl"
  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/kubectl" completion bash > "$pkgdir/usr/share/bash-completion/completions/kubectl"
  "$pkgdir/usr/bin/kubectl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_kubectl"
}

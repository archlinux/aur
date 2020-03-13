# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=3.1.2
pkgrel=2
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl: to manage the cluster'
)
conflicts=('helm')
source=("https://get.helm.sh/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('e6be589df85076108c33e12e60cfb85dcd82c5d756a6f6ebc8de0ee505c9fd4c')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  "$pkgdir/usr/bin/helm" completion zsh | sed -e 's/aliashash\["\(\w\+\)"\]/aliashash[\1]/g' > "$pkgdir/usr/share/zsh/site-functions/_helm"
}

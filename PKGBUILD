# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('b5f6a1e642971af1363cadbe1f7f37c029c11dd93813151b521c0dbeacfbdaa9')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  "$pkgdir/usr/bin/helm" completion zsh | sed -e 's/aliashash\["\(\w\+\)"\]/aliashash[\1]/g' > "$pkgdir/usr/share/zsh/site-functions/_helm"
}

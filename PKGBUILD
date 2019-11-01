# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.15.2
pkgrel=1
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('a9d2db920bd4b3d824729bbe1ff3fa57ad27760487581af6e5d3156d1b3c2511')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  "$pkgdir/usr/bin/helm" completion zsh | sed -e 's/aliashash\["\(\w\+\)"\]/aliashash[\1]/g' > "$pkgdir/usr/share/zsh/site-functions/_helm"
}

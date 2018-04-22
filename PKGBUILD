# Maintainer: Muhkoenig

pkgname=minikube-bin
pkgver=0.26.1
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'net-tools'
)
optdepends=(
  'kubectl-bin: to manage the cluster'
  'virtualbox'
  'docker-machine-kvm'
)
makedepends=()
conflicts=('minikube')

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('3c956459ee8dad9452c97d54463f982d1d511a9afaa0f3851d88320bd5dcf58a')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/minikube" completion bash > "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_minikube"
}

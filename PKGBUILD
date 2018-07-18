# Maintainer: Muhkoenig

pkgname=minikube-bin
pkgver=0.28.1
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
sha256sums=('af261082d0ba9eb2dc3836a4cd903a449bafcb8647c5d5cb555c4e9144093627')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/minikube" completion bash > "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_minikube"
}
